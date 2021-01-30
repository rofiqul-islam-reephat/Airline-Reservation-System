set serveroutput on;

declare
	bc_id number;
	x number;
begin
	bc_id := &enter_cancellation_id;
	myPackage.cancelconfirm(bc_id);
end;
/
commit;
