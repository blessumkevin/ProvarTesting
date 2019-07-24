<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_on_account_creation</fullName>
        <description>Email on account creation</description>
        <protected>false</protected>
        <recipients>
            <recipient>provartrial57@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/MarketingProductInquiryResponse</template>
    </alerts>
    <fieldUpdates>
        <fullName>Add_account_number</fullName>
        <field>AccountNumber</field>
        <formula>Name</formula>
        <name>Add account number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Workflow_On_Account_Creation</fullName>
        <actions>
            <name>Email_on_account_creation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_account_number</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>New_Account_Created</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>startsWith</operation>
            <value>workflow</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>New_Account_Created</fullName>
        <assignedTo>nonadmin57@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>365</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Account Created</subject>
    </tasks>
</Workflow>
