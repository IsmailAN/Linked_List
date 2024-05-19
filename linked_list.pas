program Tampil;

type
  PNode = ^TNode;
  TNode = record
    Info: integer;
    Next: PNode;
  end;
function PanjangList(Awal: PNode):integer;
var
  Count: integer;
  Current: PNode;
begin
  Count := 0;
  Current := Awal;
  
  while Current <> nil do
  begin
    Inc(Count);
    Current := Current^.Next;
  end;

  PanjangList := Count;
end;

procedure MaxMinLinkedList(Awal: PNode; var Max, Min: integer);
var
  Current: PNode;
begin
  // Inisialisasi nilai terbesar dan terkecil
  Max := Awal^.Info;
  Min := Awal^.Info;
  Current := Awal^.Next;

  // Iterasi melalui seluruh linked list
  while Current <> nil do
  begin
    // Update nilai terbesar dan terkecil jika ditemukan nilai yang lebih besar atau lebih kecil
    if Current^.Info > Max then
      Max := Current^.Info;
    if Current^.Info < Min then
      Min := Current^.Info;
    Current := Current^.Next;
  end;
end;

var
  Awal, Akhir, Node: PNode;
  sum,rata,panjang,Max,Min: integer;
  
begin

	
  // Initialize the list
  New(Awal);
  Awal^.Info := 3;
  New(Awal^.Next);
  Awal^.Next^.Info := 5;
  New(Awal^.Next^.Next);
  Awal^.Next^.Next^.Info := 9;
  New(Awal^.Next^.Next^.Next);
  Awal^.Next^.Next^.Next^.Info := 14;

	Awal^.Next^.Next^.Next^.Next := nil;
  	Akhir := Awal^.Next^.Next^.Next;

	MaxMinLinkedList(Awal,Max,Min);
  Node := Awal;
  sum := 0;
  
  panjang := PanjangList(Awal);
  while Node <> nil do
  begin
    write(Node^.Info,' ');
    sum := sum + Node^.Info ;
    Node := Node^.Next;
  end;
  rata := sum div panjang ;
  writeln; 
  //writeln('jumlah :' , sum);
  writeln('rata - rata :' , rata);
  writeln('Mean :' , Max - Min);
  
end.

