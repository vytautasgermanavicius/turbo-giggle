import {LightningElement, wire} from 'lwc';
import loadFilteredAccounts from '@salesforce/apex/CTRL_Accounts.getFilteredAccounts'

export default class FilteredAccounts extends LightningElement {

    isLoading = true;
    accounts = [];

    @wire(loadFilteredAccounts, {})
    wiredAccounts({error, data}) {
        if (error) {
            console.error({error});
            this.showNotification('Error!', `Error loading accounts: ${error.body.message}`, 'error');
            this.accounts = [];
        } else if (data) {
            this.accounts = data;
        }
        this.isLoading = false;
    }

    onAccountClick(event) {
        this.template.querySelector('c-account-contact')
            .onLoadContactsByAccountId(event.target.dataset.key);
    }

    setLoading(event) {
        this.isLoading = event.detail;
    }

    onNotification(event) {
        this.showNotification(event.detail.title, event.detail.message, event.detail.variant);
    }

    showNotification(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant,
            }),
        );
    }
}