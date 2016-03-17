insert into locations (contact_id, locationName, Address, Address1, City, StateOrProvince,PostalCode, WorkPhone,FaxNumber) 
Select id, id, Address, Address1, City, StateOrProvince,PostalCode, WorkPhone,FaxNumber FROM contacts;
