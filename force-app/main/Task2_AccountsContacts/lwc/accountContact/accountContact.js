import {api, LightningElement, track} from 'lwc';
import getContactsByAccountId from '@salesforce/apex/CTRL_Accounts.getContactsByAccountId'

export default class AccountContact extends LightningElement {

    @track
    contacts = [];

    @api
    onLoadContactsByAccountId(accountId) {
        this.loadContactsByAccountId(accountId);
    }

    loadContactsByAccountId(accountId) {
        getContactsByAccountId({accountId: accountId})
            .then(contacts => {
                this.contacts = contacts;
            })
            .catch(error => {
                this.contacts = [];
                console.error({error});
                const details =
                    {
                        detail: {
                            title: 'Error!',
                            message: `Error loading contacts by account Id: ${error.body.message}`,
                            variant: 'error'
                        }
                    }
                this.dispatchEvent(new CustomEvent('notify', details));
            })
            .finally(() => {
                this.dispatchEvent(new CustomEvent('loading', {detail: false}));
            })
    }

    get title() {
        if (this.haveContacts) {
            return this.contacts[0].Account.Name;
        }
        return 'No Contacts found';
    }

    get haveContacts() {
        return this.contacts && this.contacts.length > 0;
    }
}