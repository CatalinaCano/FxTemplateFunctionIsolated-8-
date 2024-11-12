Ã	
gC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\DataContext\DapperContext.cs
	namespace 	
FxTemplateAzureSQL
 
. 
DataContext (
{ 
public 

class 
DapperContext 
{ 
private		 
readonly		 
IConfiguration		 '
_config		( /
;		/ 0
private

 
readonly

 
string

 
?

  

secretName

! +
;

+ ,
public 
DapperContext 
( 
IConfiguration +
configuration, 9
)9 :
{ 	
_config 
= 
configuration #
;# $

secretName 
= 
_config  
[  !
$str! ;
]; <
;< =
} 	
public 
IDbConnection 
CreateConnection -
(- .
). /
{ 	
return 
new 
SqlConnection $
($ %
_config% ,
[, -

secretName- 7
]7 8
)8 9
;9 :
} 	
} 
} Ò'
dC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\DataContext\UnitOfWork.cs
	namespace 	
FxTemplateAzureSQL
 
. 
DataContext (
{ 
public		 

class		 

UnitOfWork		 
:		 
IUnitOfWork		 )
{

 
public 
readonly 
IConfiguration &
_config' .
;. /
private 
IDbConnection 
? 
_connection *
;* +
private 
IDbTransaction 
? 
_transaction  ,
;, -
private 
IDemoRepository 
?  
_demoRepository! 0
;0 1
private 
bool 
	_disposed 
=  
false! &
;& '
public 
readonly 
DapperContext %
_context& .
;. /
private 
readonly 
IMapper  
_mapper! (
;( )
public 

UnitOfWork 
( 
IConfiguration (
configuration) 6
,6 7
DapperContext8 E
contextF M
,M N
IMapperO V
mapperW ]
)] ^
{ 	
_config 
= 
configuration #
;# $
_context 
= 
context 
; 
_connection 
= 
context !
.! "
CreateConnection" 2
(2 3
)3 4
;4 5
_connection 
. 
Open 
( 
) 
; 
_transaction 
= 
_connection &
.& '
BeginTransaction' 7
(7 8
)8 9
;9 :
_mapper 
= 
mapper 
; 
}   	
public"" 
IDemoRepository"" 
DemoRepository"" -
{## 	
get$$ 
{$$ 
return$$ 
_demoRepository$$ (
??=$$) ,
new$$- 0
DemoRepository$$1 ?
($$? @
_transaction$$@ L
,$$L M
_mapper$$N U
)$$U V
;$$V W
}$$X Y
}%% 	
public'' 
void'' 
Commit'' 
('' 
)'' 
{(( 	
try)) 
{** 
_transaction++ 
?++ 
.++ 
Commit++ $
(++$ %
)++% &
;++& '
},, 
catch-- 
{.. 
_transaction// 
?// 
.// 
Rollback// &
(//& '
)//' (
;//( )
throw00 
;00 
}11 
finally22 
{33 
_transaction44 
?44 
.44 
Dispose44 %
(44% &
)44& '
;44' (
_transaction55 
=55 
_connection55 *
?55* +
.55+ ,
BeginTransaction55, <
(55< =
)55= >
;55> ?
ResetRepositories66 !
(66! "
)66" #
;66# $
}77 
}88 	
private:: 
void:: 
ResetRepositories:: &
(::& '
)::' (
{;; 	
_demoRepository<< 
=<< 
null<< "
;<<" #
}== 	
public?? 
void?? 
Dispose?? 
(?? 
)?? 
{@@ 	
DisposeAA 
(AA 
trueAA 
)AA 
;AA 
GCBB 
.BB 
SuppressFinalizeBB 
(BB  
thisBB  $
)BB$ %
;BB% &
}CC 	
	protectedEE 
virtualEE 
voidEE 
DisposeEE &
(EE& '
boolEE' +
	disposingEE, 5
)EE5 6
{FF 	
ifGG 
(GG 
!GG 
	_disposedGG 
)GG 
{HH 
ifII 
(II 
	disposingII 
)II 
{JJ 
ifKK 
(KK 
_transactionKK $
!=KK% '
nullKK( ,
)KK, -
{LL 
_transactionMM $
.MM$ %
DisposeMM% ,
(MM, -
)MM- .
;MM. /
_transactionNN $
=NN% &
nullNN' +
;NN+ ,
}OO 
ifPP 
(PP 
_connectionPP #
!=PP$ &
nullPP' +
)PP+ ,
{QQ 
_connectionRR #
.RR# $
DisposeRR$ +
(RR+ ,
)RR, -
;RR- .
_connectionSS #
=SS$ %
nullSS& *
;SS* +
}TT 
}UU 
	_disposedVV 
=VV 
trueVV  
;VV  !
}WW 
}XX 	
~ZZ 	

UnitOfWorkZZ	 
(ZZ 
)ZZ 
{[[ 	
Dispose\\ 
(\\ 
false\\ 
)\\ 
;\\ 
}]] 	
}^^ 
}__ ’E
XC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\FxTemplate.cs
	namespace 	
FxTemplateAzureSQL
 
{ 
public 

class 

FxTemplate 
( 

IValidator &
<& '
	DemoInput' 0
>0 1
demoValidator2 ?
,? @
IHttpServiceA M
httpServiceN Y
,Y Z
ILogger[ b
<b c

FxTemplatec m
>m n
loggero u
,u v
IUnitOfWork	w Ç

unitOfWork
É ç
)
ç é
{ 
private 
readonly 

IValidator #
<# $
	DemoInput$ -
>- .
_demoValidator/ =
=> ?
demoValidator@ M
;M N
private 
readonly 
IHttpService %
_httpService& 2
=3 4
httpService5 @
;@ A
private 
readonly 
ILogger  
<  !

FxTemplate! +
>+ ,
_logger- 4
=5 6
logger7 =
;= >
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
=1 2

unitOfWork3 =
;= >
[** 	
Function**	 
(** 
$str** 
)** 
]** 
[,, 	
OpenApiOperation,,	 
(,, 
operationId,, %
:,,% &
$str,,' <
,,,< =
tags,,> B
:,,B C
[,,D E
$str,,E Z
],,Z [
,,,[ \
Description,,] h
=,,i j
$str	,,k Ü
,
,,Ü á
Summary
,,à è
=
,,ê ë
$str
,,í ¨
)
,,¨ ≠
]
,,≠ Æ
[-- 	
OpenApiSecurity--	 
(-- 
$str-- '
,--' (
SecuritySchemeType--) ;
.--; <
ApiKey--< B
,--B C
Name--D H
=--I J
$str--K Q
,--Q R
In--S U
=--V W'
OpenApiSecurityLocationType--X s
.--s t
Query--t y
)--y z
]--z {
[// 	
OpenApiRequestBody//	 
(// 
contentType// '
://' (
$str//) ;
,//; <
bodyType//= E
://E F
typeof//G M
(//M N
	DemoInput//N W
)//W X
,//X Y
Required//Z b
=//c d
true//e i
,//i j
Description//k v
=//w x
$str	//y ç
)
//ç é
]
//é è
[11 	#
OpenApiResponseWithBody11	  
(11  !

statusCode11! +
:11+ ,
HttpStatusCode11- ;
.11; <
OK11< >
,11> ?
contentType11@ K
:11K L
$str11M _
,11_ `
bodyType11a i
:11i j
typeof11k q
(11q r
string11r x
)11x y
,11y z
Description	11{ Ü
=
11á à
$str
11â ö
)
11ö õ
]
11õ ú
[22 	#
OpenApiResponseWithBody22	  
(22  !

statusCode22! +
:22+ ,
HttpStatusCode22- ;
.22; <
Created22< C
,22C D
contentType22E P
:22P Q
$str22R d
,22d e
bodyType22f n
:22n o
typeof22p v
(22v w
ResponseResult	22w Ö
)
22Ö Ü
,
22Ü á
Description
22à ì
=
22î ï
$str
22ñ ≠
)
22≠ Æ
]
22Æ Ø
[33 	#
OpenApiResponseWithBody33	  
(33  !

statusCode33! +
:33+ ,
HttpStatusCode33- ;
.33; <
	NoContent33< E
,33E F
contentType33G R
:33R S
$str33T f
,33f g
bodyType33h p
:33p q
typeof33r x
(33x y
ResponseResult	33y á
)
33á à
,
33à â
Description
33ä ï
=
33ñ ó
$str
33ò §
)
33§ •
]
33• ¶
[44 	#
OpenApiResponseWithBody44	  
(44  !

statusCode44! +
:44+ ,
HttpStatusCode44- ;
.44; <

BadRequest44< F
,44F G
contentType44H S
:44S T
$str44U g
,44g h
bodyType44i q
:44q r
typeof44s y
(44y z
ResponseResult	44z à
)
44à â
,
44â ä
Description
44ã ñ
=
44ó ò
$str
44ô ¶
)
44¶ ß
]
44ß ®
[55 	#
OpenApiResponseWithBody55	  
(55  !

statusCode55! +
:55+ ,
HttpStatusCode55- ;
.55; <
InternalServerError55< O
,55O P
contentType55Q \
:55\ ]
$str55^ p
,55p q
bodyType55r z
:55z {
typeof	55| Ç
(
55Ç É
ResponseResult
55É ë
)
55ë í
,
55í ì
Description
55î ü
=
55† °
$str
55¢ ∏
)
55∏ π
]
55π ∫
public66 
async66 
Task66 
<66 
IActionResult66 '
>66' (
NombreFuncionalidad66) <
(66< =
[77 
HttpTrigger77 
(77 
AuthorizationLevel77 +
.77+ ,
Function77, 4
,774 5
$str776 ;
,77; <
Route77= B
=77C D
$str77E S
)77S T
]77T U
HttpRequest77V a
req77b e
)77e f
{88 	
try99 
{:: 
_logger;; 
.;; 
LogInformation;; &
(;;& '
$str;;' V
);;V W
;;;W X
var<< 
json<< 
=<< 
await<<  
req<<! $
.<<$ %
ReadAsStringAsync<<% 6
(<<6 7
)<<7 8
;<<8 9
if>> 
(>> 
json>> 
is>> 
not>> 
null>>  $
)>>$ %
{?? 
	DemoInput@@ 
?@@ 
request@@ &
=@@' (
JsonConvert@@) 4
.@@4 5
DeserializeObject@@5 F
<@@F G
	DemoInput@@G P
>@@P Q
(@@Q R
json@@R V
)@@V W
;@@W X
ifBB 
(BB 
requestBB 
isBB !
notBB" %
nullBB& *
)BB* +
{CC 
varDD 
validationResultDD ,
=DD- .
_demoValidatorDD/ =
.DD= >
ValidateDD> F
(DDF G
requestDDG N
)DDN O
;DDO P
ifEE 
(EE 
validationResultEE ,
.EE, -
IsValidEE- 4
)EE4 5
{FF 
ResponseApiGG '
dataGG( ,
=GG- .
awaitGG/ 4
_httpServiceGG5 A
.GGA B
GetDataAsyncGGB N
(GGN O
requestGGO V
.GGV W
EdadGGW [
)GG[ \
;GG\ ]
awaitHH !
_unitOfWorkHH" -
.HH- .
DemoRepositoryHH. <
.HH< =

InsertDataHH= G
(HHG H
dataHHH L
,HHL M
requestHHN U
.HHU V
EmailHHV [
)HH[ \
;HH\ ]
returnII "
HttpResponseHelperII# 5
.II5 6 
SuccessfullOperationII6 J
(IIJ K
SupportedResponsesIIK ]
.II] ^(
Registro_creado_exitosamenteII^ z
)IIz {
;II{ |
}JJ 
elseKK 
{LL 
stringMM "
	allErrorsMM# ,
=MM- .
stringMM/ 5
.MM5 6
JoinMM6 :
(MM: ;
EnvironmentMM; F
.MMF G
NewLineMMG N
,MMN O
validationResultMMP `
.MM` a
ErrorsMMa g
.MMg h
SelectMMh n
(MMn o
eMMo p
=>MMq s
eMMt u
.MMu v
ErrorMessage	MMv Ç
)
MMÇ É
)
MMÉ Ñ
;
MMÑ Ö
returnNN "
HttpResponseHelperNN# 5
.NN5 6

BadRequestNN6 @
(NN@ A
nullNNA E
,NNE F
	allErrorsNNG P
)NNP Q
;NNQ R
}OO 
}PP 
}SS 
returnUU 
HttpResponseHelperUU )
.UU) *

BadRequestUU* 4
(UU4 5
nullUU5 9
,UU9 :
$strUU; e
)UUe f
;UUf g
}VV 
catchWW 
(WW 
	ExceptionWW 
exWW 
)WW  
{XX 
_loggerYY 
.YY 
LogErrorYY  
(YY  !
exYY! #
,YY# $
$strYY% 7
)YY7 8
;YY8 9
returnZZ 
HttpResponseHelperZZ )
.ZZ) *
InternalServerErrorZZ* =
(ZZ= >
exZZ> @
.ZZ@ A
MessageZZA H
)ZZH I
;ZZI J
}[[ 
}\\ 	
}]] 
}^^ à
eC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Interfaces\IHttpService.cs
	namespace 	
FxTemplateAzureSQL
 
. 

Interfaces '
{ 
public 

	interface 
IHttpService !
{ 
public 
Task 
< 
ResponseApi 
>  
GetDataAsync! -
(- .
int. 1
index2 7
)7 8
;8 9
} 
}		 £
zC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Interfaces\RepositoryPattern\IDemoRepository.cs
	namespace 	
FxTemplateAzureSQL
 
. 

Interfaces '
.' (
RepositoryPattern( 9
{ 
public 

	interface 
IDemoRepository $
{ 
public 
Task 

InsertData 
( 
ResponseApi *
demo+ /
,/ 0
string1 7
correo8 >
)> ?
;? @
public

 

DemoRecord

 
ValidarData

 %
(

% &
string

& ,
filter

- 3
,

3 4
string

5 ;
value

< A
)

A B
;

B C
} 
} Ñ
vC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Interfaces\RepositoryPattern\IUnitOfWork.cs
	namespace 	
FxTemplateAzureSQL
 
. 

Interfaces '
.' (
RepositoryPattern( 9
{ 
public 

	interface 
IUnitOfWork  
:! "
IDisposable# .
{ 
IDemoRepository 
DemoRepository &
{' (
get) ,
;, -
}. /
public 
void 
Commit 
( 
) 
; 
} 
}		 ›
hC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Mappers\MappingProfileDemo.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Mappers $
{ 
public 

class 
MappingProfileDemo #
:$ %
Profile& -
{ 
public		 
MappingProfileDemo		 !
(		! "
)		" #
{

 	
	CreateMap 
< 
ResponseApi !
,! "

DemoRecord# -
>- .
(. /
)/ 0
. 
	ForMember 
( 
dest 
=> 
dest "
." #
Nombre# )
,) *
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
Name4 8
)8 9
)9 :
. 
	ForMember 
( 
dest 
=> 
dest "
." #
Apellido# +
,+ ,
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
Species4 ;
); <
)< =
. 
	ForMember 
( 
dest 
=>  
dest! %
.% &
Edad& *
,* +
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
Id4 6
)6 7
)7 8
. 
	ForMember 
( 
dest 
=> 
dest "
." #
Mail# '
,' (
opt 
=> 
opt  
.  !
MapFrom! (
(( )
src) ,
=>- /
src0 3
.3 4
Name4 8
.8 9
Trim9 =
(= >
)> ?
.? @
ToLower@ G
(G H
)H I
+J K
$strL W
)W X
)X Y
;Y Z
} 	
} 
} Í
dC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Models\Input\DemoInput.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Models #
.# $
Input$ )
{ 
[ 
OpenApiExample 
( 
typeof 
( 
DemoInputExample +
)+ ,
), -
]- .
public 

class 
	DemoInput 
{		 
[

 	
JsonProperty

	 
(

 
$str

 
)

 
]

  
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' >
,> ?
Nullable@ H
=I J
falseK P
)P Q
]Q R
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
[ 	
JsonProperty	 
( 
$str  
)  !
]! "
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' ?
,? @
NullableA I
=J K
falseL Q
)Q R
]R S
public 
string 
Apellido 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
JsonProperty	 
( 
$str 
) 
] 
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' ;
,; <
Nullable= E
=F G
falseH M
)M N
]N O
public 
int 
Edad 
{ 
get 
; 
set "
;" #
}$ %
[ 	
JsonProperty	 
( 
$str 
) 
] 
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' a
,a b
Nullablec k
=l m
falsen s
)s t
]t u
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ò
gC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Models\Records\DemoRecord.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Models #
.# $
Records$ +
{ 
public 

record 

DemoRecord 
{ 
public 
required 
string 
Nombre %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
required 
string 
Apellido '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
required 
int 
Edad  
{! "
get# &
;& '
set( +
;+ ,
}- .
public		 
required		 
string		 
Mail		 #
{		$ %
get		& )
;		) *
set		+ .
;		. /
}		0 1
}

 
} ò"
lC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Models\ResponseAPI\ResponseApi.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Models #
.# $
ResponseAPI$ /
{ 
public 

class 
ResponseApi 
{ 
[ 	
JsonPropertyName	 
( 
$str 
) 
]  
public		 
int		 
?		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
[ 	
JsonPropertyName	 
( 
$str  
)  !
]! "
public 
string 
? 
Name 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonPropertyName	 
( 
$str "
)" #
]# $
public 
string 
? 
Status 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonPropertyName	 
( 
$str #
)# $
]$ %
public 
string 
? 
Species 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
JsonPropertyName	 
( 
$str  
)  !
]! "
public 
string 
? 
Type 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
JsonPropertyName	 
( 
$str "
)" #
]# $
public 
string 
? 
Gender 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
JsonPropertyName	 
( 
$str "
)" #
]# $
public 
Location 
? 
Origin 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
JsonPropertyName	 
( 
$str $
)$ %
]% &
public 
Location 
? 
Location !
{" #
get$ '
;' (
set) ,
;, -
}. /
[   	
JsonPropertyName  	 
(   
$str   !
)  ! "
]  " #
public!! 
string!! 
?!! 
Image!! 
{!! 
get!! "
;!!" #
set!!$ '
;!!' (
}!!) *
[## 	
JsonPropertyName##	 
(## 
$str## #
)### $
]##$ %
public$$ 
List$$ 
<$$ 
string$$ 
>$$ 
?$$ 
Episode$$ $
{$$% &
get$$' *
;$$* +
set$$, /
;$$/ 0
}$$1 2
[&& 	
JsonPropertyName&&	 
(&& 
$str&& 
)&&  
]&&  !
public'' 
string'' 
?'' 
Url'' 
{'' 
get''  
;''  !
set''" %
;''% &
}''' (
[)) 	
JsonPropertyName))	 
()) 
$str)) #
)))# $
]))$ %
public** 
DateTime** 
?** 
Created**  
{**! "
get**# &
;**& '
set**( +
;**+ ,
}**- .
}++ 
public-- 

partial-- 
class-- 
Location-- !
{.. 
[// 	
JsonProperty//	 
(// 
$str// 
)// 
]// 
public00 
string00 
?00 
Name00 
{00 
get00 !
;00! "
set00# &
;00& '
}00( )
[22 	
JsonProperty22	 
(22 
$str22 
)22 
]22 
public33 
Uri33 
?33 
Url33 
{33 
get33 
;33 
set33 "
;33" #
}33$ %
}44 
}55 ’
cC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Models\ResponseResult.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Models #
{ 
public 

class 
ResponseResult 
{ 
[ 	
JsonProperty	 
( 
$str 
)  
]  !
[		 	
OpenApiProperty			 
(		 
Description		 $
=		% &
$str		' J
,		J K
Nullable		L T
=		U V
false		W \
)		\ ]
]		] ^
public

 
string

 
Message

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
[ 	
JsonProperty	 
( 
$str 
) 
] 
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' O
,O P
NullableQ Y
=Z [
false\ a
)a b
]b c
public 
int 
Code 
{ 
get 
; 
set "
;" #
}$ %
[ 	
JsonProperty	 
( 
$str 
) 
] 
[ 	
OpenApiProperty	 
( 
Description $
=% &
$str' 9
,9 :
Nullable; C
=D E
trueF J
)J K
]K L
public 
dynamic 
? 
Data 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ˇ

fC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\OpenApi\DemoInputExample.cs
	namespace 	
FxTemplateAzureSQL
 
. 
OpenApi $
{ 
public 

class 
DemoInputExample !
:" #
OpenApiExample$ 2
<2 3
	DemoInput3 <
>< =
{		 
public

 
override

 
IOpenApiExample

 '
<

' (
	DemoInput

( 1
>

1 2
Build

3 8
(

8 9
NamingStrategy

9 G
?

G H
namingStrategy

I W
=

X Y
null

Z ^
)

^ _
{ 	
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str '
,' (
new 
	DemoInput !
(! "
)" #
{ 
Nombre 
=  
$str! '
,' (
Apellido  
=! "
$str# &
,& '
Edad 
= 
$num !
,! "
Email 
= 
$str  /
} 
, 
namingStrategy "
) 
) 
; 
return 
this 
; 
} 	
} 
} ì	
kC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\OpenApi\ResponseResultExample.cs
	namespace 	
FxTemplateAzureSQL
 
. 
OpenApi $
{ 
public		 

class		 !
ResponseResultExample		 &
:		' (
OpenApiExample		) 7
<		7 8
ResponseResult		8 F
>		F G
{

 
public 
override 
IOpenApiExample '
<' (
ResponseResult( 6
>6 7
Build8 =
(= >
NamingStrategy> L
?L M
namingStrategyN \
=] ^
null_ c
)c d
{ 	
Examples 
. 
Add 
( "
OpenApiExampleResolver &
.& '
Resolve' .
(. /
$str '
,' (
HttpResponseHelper '
.' (
	NoContent( 1
(1 2
)2 3
,3 4
namingStrategy "
) 
) 
; 
return 
this 
; 
} 	
} 
} ˆ4
UC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Program.cs
var 
host 
=	 

new 
HostBuilder 
( 
) 
. ,
 ConfigureFunctionsWebApplication %
(% &
)& '
. %
ConfigureAppConfiguration 
( 
(  
context  '
,' (
config) /
)/ 0
=>1 3
{ 
var 
env 
= 
context 
. 
HostingEnvironment ,
., -
EnvironmentName- <
;< =
config 
. 
SetBasePath 
( 
	Directory $
.$ %
GetCurrentDirectory% 8
(8 9
)9 :
): ;
. 
AddJsonFile 
( 
$str 0
,0 1
optional2 :
:: ;
true< @
,@ A
reloadOnChangeB P
:P Q
trueR V
)V W
. #
AddEnvironmentVariables &
(& '
)' (
.( )
Build) .
(. /
)/ 0
;0 1
var 
keyVaultName 
= 
Environment &
.& '"
GetEnvironmentVariable' =
(= >
$str> N
)N O
;O P
var 
keyVaultUrl 
= 
$" 
$str $
{$ %
keyVaultName% 1
}1 2
$str2 C
"C D
;D E
var 
tenantId 
= 
Environment "
." #"
GetEnvironmentVariable# 9
(9 :
$str: I
)I J
;J K
var 
credentialOptions 
= 
new  #)
DefaultAzureCredentialOptions$ A
{   	
TenantId!! 
=!! 
tenantId!! 
}"" 	
;""	 

var## 

credential## 
=## 
new## "
DefaultAzureCredential## 3
(##3 4
credentialOptions##4 E
)##E F
;##F G
var&& 
client&& 
=&& 
new&& 
SecretClient&& %
(&&% &
new&&& )
Uri&&* -
(&&- .
keyVaultUrl&&. 9
)&&9 :
,&&: ;

credential&&< F
)&&F G
;&&G H
var'' 
secrets'' 
='' 
client'' 
.'' "
GetPropertiesOfSecrets'' 3
(''3 4
)''4 5
;''5 6
if)) 

()) 
secrets)) 
is)) 
not)) 
null)) 
)))  
{** 	
foreach++ 
(++ 
var++ 
secret++ 
in++  "
secrets++# *
.++* +
Select+++ 1
(++1 2
x++2 3
=>++4 6
x++7 8
.++8 9
Name++9 =
)++= >
)++> ?
{,, 
var-- 
secretValue-- 
=--  !
client--" (
.--( )
	GetSecret--) 2
(--2 3
secret--3 9
)--9 :
.--: ;
Value--; @
.--@ A
Value--A F
;--F G
config.. 
... !
AddInMemoryCollection.. ,
(.., -
[..- .
new... 1
KeyValuePair..2 >
<..> ?
string..? E
,..E F
string..G M
>..M N
(..N O
secret..O U
,..U V
secretValue..W b
)..b c
]..c d
)..d e
;..e f
}// 
}00 	
}33 
)33 
.44 
ConfigureServices44 
(44 
(44 
context44 
,44  
services44! )
)44) *
=>44+ -
{55 
services66 
.66 
AddSingleton66 
(66 
context66 %
.66% &
Configuration66& 3
)663 4
;664 5
services77 
.77 
AddSingleton77 
<77 
SecretClient77 *
>77* +
(77+ ,
)77, -
;77- .
services88 
.88 
AddSingleton88 
<88 
DapperContext88 +
>88+ ,
(88, -
)88- .
;88. /
services99 
.99 
AddAutoMapper99 
(99 
typeof99 %
(99% &
Program99& -
)99- .
)99. /
;99/ 0
services:: 
.:: 

AddMvcCore:: 
(:: 
):: 
.;; 
AddNewtonsoftJson;; "
(;;" #
jsonOptions;;# .
=>;;/ 1
{<< 
jsonOptions== 
.==  
SerializerSettings==  2
.==2 3
NullValueHandling==3 D
===E F
NullValueHandling==G X
.==X Y
Ignore==Y _
;==_ `
}>> 
)>> 
;>> 
servicesEE 
.EE 
AddHttpClientEE 
(EE 
$strEE ,
,EE, -
clientEE. 4
=>EE5 7
{FF 	
clientGG 
.GG !
DefaultRequestHeadersGG (
.GG( )
AddGG) ,
(GG, -
$strGG- 5
,GG5 6
$strGG7 I
)GGI J
;GGJ K
clientHH 
.HH 
TimeoutHH 
=HH 
TimeSpanHH %
.HH% &
FromSecondsHH& 1
(HH1 2
$numHH2 4
)HH4 5
;HH5 6
}II 	
)II	 

;II
 
servicesLL 
.LL 
AddTransientLL 
<LL 
IHttpServiceLL *
,LL* +
HttpServiceLL, 7
>LL7 8
(LL8 9
)LL9 :
;LL: ;
servicesUU 
.UU 
AddTransientUU 
<UU 
IUnitOfWorkUU )
,UU) *

UnitOfWorkUU+ 5
>UU5 6
(UU6 7
)UU7 8
;UU8 9
servicesVV 
.VV 
AddTransientVV 
<VV 
IDemoRepositoryVV -
,VV- .
DemoRepositoryVV/ =
>VV= >
(VV> ?
)VV? @
;VV@ A
services]] 
.]] 
	AddScoped]] 
<]] 

IValidator]] %
<]]% &
	DemoInput]]& /
>]]/ 0
,]]0 1
DemoInputValidator]]2 D
>]]D E
(]]E F
)]]F G
;]]G H
}`` 
)`` 
.aa 
Buildaa 

(aa
 
)aa 
;aa 
hostcc 
.cc 
Runcc 
(cc 	
)cc	 

;cc
 û!
iC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Repositories\DemoRepository.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Repositories )
{		 
public 

class 
DemoRepository 
(  
IDbTransaction  .
?. /
transaction0 ;
,; <
IMapper= D
?D E
mapperF L
)L M
:N O
RepositoryBaseP ^
(^ _
transaction_ j
)j k
,k l
IDemoRepositorym |
{ 
private 
readonly 
IMapper  
?  !
_mapper" )
=* +
mapper, 2
;2 3
public 
async 
Task 

InsertData $
($ %
ResponseApi% 0
demo1 5
,5 6
string7 =
correo> D
)D E
{ 	

DemoRecord 
data 
= 
_mapper %
.% &
Map& )
<) *

DemoRecord* 4
>4 5
(5 6
demo6 :
): ;
;; <
string 
sqlQuery 
= 
$str )
;) *
var 

parameters 
= 
new  
DynamicParameters! 2
(2 3
)3 4
;4 5

parameters 
. 
Add 
( 
$str $
,$ %
data& *
.* +
Nombre+ 1
,1 2
DbType3 9
.9 :
String: @
)@ A
;A B

parameters 
. 
Add 
( 
$str &
,& '
data( ,
., -
Apellido- 5
,5 6
DbType7 =
.= >
String> D
)D E
;E F

parameters   
.   
Add   
(   
$str   "
,  " #
data  $ (
.  ( )
Edad  ) -
,  - .
DbType  / 5
.  5 6
Int32  6 ;
)  ; <
;  < =

parameters!! 
.!! 
Add!! 
(!! 
$str!! $
,!!$ %
correo!!& ,
,!!, -
DbType!!. 4
.!!4 5
String!!5 ;
)!!; <
;!!< =
await"" 

Connection"" 
."" 

QueryAsync"" '
(""' (
sqlQuery""( 0
,""0 1

parameters""2 <
,""< =
Transaction""> I
,""I J
commandType""K V
:""V W
CommandType""X c
.""c d
Text""d h
)""h i
;""i j
Transaction## 
.## 
Commit## 
(## 
)##  
;##  !
}$$ 	
public&& 

DemoRecord&& 
ValidarData&& %
(&&% &
string&&& ,
filter&&- 3
,&&3 4
string&&5 ;
value&&< A
)&&A B
{'' 	
string(( 
sqlQuery(( 
=(( 
$@"(( !
$str()! <
{))< =
filter))= C
}))C D
$str))D H
{))H I
filter))I O
}))O P
"))P Q
;))Q R
var** 

parameters** 
=** 
new**  
DynamicParameters**! 2
(**2 3
)**3 4
;**4 5

parameters++ 
.++ 
Add++ 
(++ 
filter++ !
,++! "
value++# (
,++( )
DbType++* 0
.++0 1
String++1 7
)++7 8
;++8 9

DemoRecord-- 
data-- 
=-- 

Connection-- (
.--( )
QueryFirstOrDefault--) <
<--< =

DemoRecord--= G
>--G H
(--H I
sqlQuery--I Q
,--Q R

parameters--S ]
,--] ^
Transaction--_ j
)--j k
;--k l
Transaction.. 
... 
Commit.. 
(.. 
)..  
;..  !
return// 
data// 
;// 
}00 	
}11 
}22 Ÿ
iC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Repositories\RepositoryBase.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Repositories )
{ 
public 

abstract 
class 
RepositoryBase (
(( )
IDbTransaction) 7
?7 8
transaction9 D
)D E
{ 
	protected 
IDbTransaction  
?  !
Transaction" -
{. /
get0 3
;3 4
private5 <
set= @
;@ A
}B C
=D E
transactionF Q
;Q R
	protected		 
IDbConnection		 
?		  

Connection		! +
{

 	
get 
{ 
return 
Transaction $
?$ %
.% &

Connection& 0
;0 1
}2 3
} 	
} 
} é
bC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Services\HttpService.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Services %
{ 
public 

class 
HttpService 
( 
IHttpClientFactory /
clientFactory0 =
,= >
IConfiguration? M
configurationN [
)[ \
:] ^
IHttpService_ k
{		 
private

 
readonly

 

HttpClient

 #
_httpClient

$ /
=

0 1
clientFactory

2 ?
.

? @
CreateClient

@ L
(

L M
$str

M Z
)

Z [
;

[ \
public 
readonly 
IConfiguration &
_configuration' 5
=6 7
configuration8 E
;E F
public 
async 
Task 
< 
ResponseApi %
>% &
GetDataAsync' 3
(3 4
int4 7
index8 =
)= >
{ 	
var 
response 
= 
await  
_httpClient! ,
., -
GetAsync- 5
(5 6
$"6 8
{8 9
_configuration9 G
[G H
$strH h
]h i
}i j
{j k
indexk p
}p q
"q r
)r s
;s t
response 
. #
EnsureSuccessStatusCode ,
(, -
)- .
;. /
var 
jsonResponse 
= 
await $
response% -
.- .
Content. 5
.5 6
ReadAsStringAsync6 G
(G H
)H I
;I J
return 
JsonSerializer !
.! "
Deserialize" -
<- .
ResponseApi. 9
>9 :
(: ;
jsonResponse; G
)G H
;H I
} 	
} 
} ﬂ0
fC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Utils\HttpResponseHelper.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Utils "
{ 
public 

static 
class 
HttpResponseHelper *
{ 
public 
static 
ObjectResult "
SuccessfulResponse# 5
(5 6
object6 <
response= E
,E F
SupportedResponsesG Y
?Y Z
mensaje[ b
=c d
nulle i
,i j
stringk q
?q r!
mensajePersonalizado	s á
=
à â
null
ä é
)
é è
{		 	
var

 

responseOK

 
=

 
new

  
ResponseResult

! /
(

/ 0
)

0 1
{ 
Message 
= 
mensaje !
is" $
null% )
?* + 
mensajePersonalizado, @
:A B
ObtenerMensajeC Q
(Q R
mensajeR Y
)Y Z
,Z [
Code 
= 
$num 
, 
Data 
= 
response 
} 
; 
return 
Response 
( 

responseOK &
.& '
Code' +
,+ ,

responseOK- 7
)7 8
;8 9
} 	
public 
static 
ObjectResult "
	NoContent# ,
(, -
)- .
{ 	
var 
responseNoContent !
=" #
new$ '
ResponseResult( 6
(6 7
)7 8
{ 
Message 
= 
ObtenerMensaje (
(( )
SupportedResponses) ;
.; <"
Registro_no_encontrado< R
)R S
,S T
Code 
= 
$num 
} 
; 
return 
Response 
( 
responseNoContent -
.- .
Code. 2
,2 3
responseNoContent4 E
)E F
;F G
} 	
public 
static 
ObjectResult " 
SuccessfullOperation# 7
(7 8
SupportedResponses8 J
mensajeK R
)R S
{ 	
var (
responseSuccessfullOperation ,
=- .
new/ 2
ResponseResult3 A
(A B
)B C
{   
Message!! 
=!! 
ObtenerMensaje!! (
(!!( )
mensaje!!) 0
)!!0 1
,!!1 2
Code"" 
="" 
$num"" 
}## 
;## 
return$$ 
Response$$ 
($$ (
responseSuccessfullOperation$$ 8
.$$8 9
Code$$9 =
,$$= >(
responseSuccessfullOperation$$? [
)$$[ \
;$$\ ]
}%% 	
public'' 
static'' 
ObjectResult'' "

BadRequest''# -
(''- .
SupportedResponses''. @
?''@ A
mensaje''B I
=''J K
null''L P
,''P Q
string''R X
?''X Y 
mensajePersonalizado''Z n
=''o p
null''q u
)''u v
{(( 	
string)) 
mensajeFinal)) 
=))  ! 
mensajePersonalizado))" 6
is))7 9
null)): >
?))? @
$str))A D
:))E F 
mensajePersonalizado))G [
.))[ \
ToString))\ d
())d e
)))e f
;))f g
var** #
responseFailedOperation** '
=**( )
new*** -
ResponseResult**. <
(**< =
)**= >
{++ 
Message,, 
=,, 
mensaje,, !
is,," $
null,,% )
?,,* +
mensajeFinal,,, 8
:,,9 :
ObtenerMensaje,,; I
(,,I J
mensaje,,J Q
),,Q R
,,,R S
Code-- 
=-- 
$num-- 
}.. 
;.. 
return00 
Response00 
(00 #
responseFailedOperation00 3
.003 4
Code004 8
,008 9#
responseFailedOperation00: Q
)00Q R
;00R S
}11 	
public33 
static33 
ObjectResult33 "
InternalServerError33# 6
(336 7
string337 =
mensaje33> E
)33E F
{44 	
var55 
responseNoContent55 !
=55" #
new55$ '
ResponseResult55( 6
(556 7
)557 8
{66 
Message77 
=77 
mensaje77 !
,77! "
Code88 
=88 
$num88 
}99 
;99 
return:: 
Response:: 
(:: 
responseNoContent:: -
.::- .
Code::. 2
,::2 3
responseNoContent::4 E
)::E F
;::F G
};; 	
public== 
static== 
ObjectResult== "
Response==# +
(==+ ,
int==, /
code==0 4
,==4 5
object==6 <
value=== B
)==B C
{>> 	
var?? 
result?? 
=?? 
new?? 
ObjectResult?? )
(??) *
value??* /
)??/ 0
{@@ 

StatusCodeAA 
=AA 
codeAA !
}BB 
;BB 
returnCC 
resultCC 
;CC 
}DD 	
publicFF 
staticFF 
stringFF 
ObtenerMensajeFF +
(FF+ ,
SupportedResponsesFF, >
?FF> ?
mensajeFF@ G
)FFG H
{GG 	
returnHH 
mensajeHH 
isHH 
nullHH "
?HH# $
$strHH% 2
:HH3 4
mensajeHH5 <
.HH< =
ToStringHH= E
(HHE F
)HHF G
.HHG H
ReplaceHHH O
(HHO P
$charHHP S
,HHS T
$charHHU X
)HHX Y
;HHY Z
}II 	
}JJ 
}KK 
fC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Utils\SupportedResponses.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Utils "
{ 
public 

enum 
SupportedResponses "
{ 
[ 	

EnumMember	 
( 
Value 
= 
$str .
). /
]/ 0
Consulta_exitosa 
, 
[

 	

EnumMember

	 
(

 
Value

 
=

 
$str

 9
)

9 :
]

: ;'
No_se_encontraron_registros #
,# $
[ 	

EnumMember	 
( 
Value 
= 
$str 1
)1 2
]2 3
Registro_encontrado 
, 
[ 	

EnumMember	 
( 
Value 
= 
$str 4
)4 5
]5 6"
Registro_no_encontrado 
, 
[ 	

EnumMember	 
( 
Value 
= 
$str :
): ;
]; <(
Registro_creado_exitosamente $
,$ %
[ 	

EnumMember	 
( 
Value 
= 
$str ?
)? @
]@ A-
!Registro_actualizado_exitosamente )
,) *
[ 	

EnumMember	 
( 
Value 
= 
$str =
)= >
]> ?+
Registro_eliminado_exitosamente '
,' (
} 
} ’
jC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Validator\DemoInputValidator.cs
	namespace 	
FxTemplateAzureSQL
 
. 
	Validator &
{ 
public 

class 
DemoInputValidator #
:$ %
AbstractValidator& 7
<7 8
	DemoInput8 A
>A B
{		 
public

 
readonly

 
IConfiguration

 &
_configuration

' 5
;

5 6
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
DemoInputValidator !
(! "
IConfiguration" 0
configuration1 >
,> ?
IUnitOfWork@ K

unitOfWorkL V
)V W
{ 	
_configuration 
= 
configuration *
;* +
_unitOfWork 
= 

unitOfWork $
;$ %
RuleFor 
( 
x 
=> 
x 
. 
Nombre !
)! "
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
)  
.  !
WithMessage! ,
(, -
$str- Y
)Y Z
;Z [
RuleFor 
( 
x 
=> 
x 
. 
Apellido #
)# $
. 
NotNull 
( 
) 
. 
NotEmpty 
(  
)  !
.! "
WithMessage" -
(- .
$str. Z
)Z [
;[ \
RuleFor 
( 
x 
=> 
x 
. 
Edad 
)  
. 
NotNull 
( 
) 
. 
NotEmpty 
( 
)  
.  !
WithMessage! ,
(, -
$str- Y
)Y Z
. 
GreaterThan 
( 
$num 
) 
. 
WithMessage &
(& '
$str' N
)N O
;O P
RuleFor 
( 
property 
=> 
property  (
.( )
Email) .
). /
.   
NotNull   
(   
)   
.   
NotEmpty   
(   
)    
.    !
WithMessage  ! ,
(  , -
$str  - Y
)  Y Z
.!! 
Matches!! 
(!! 
_configuration!! "
[!!" #
$str!!# :
]!!: ;
)!!; <
.!!< =
WithMessage!!= H
(!!H I
$str!!I d
)!!d e
."" 
Must"" 
("" 
("" 
usuario"" 
,"" 
CorreoElecronico"" ,
)"", -
=>"". 0
VerificarExistencia""1 D
(""D E
$str""E M
,""M N
usuario""O V
)""V W
)""W X
.## 
WithMessage## 
(## 
$str## a
)##a b
;##b c
}$$ 	
private'' 
bool'' 
VerificarExistencia'' (
(''( )
string'') /
filter''0 6
,''6 7
	DemoInput''8 A
data''B F
)''F G
{(( 	
var)) 
response)) 
=)) 
_unitOfWork)) &
.))& '
DemoRepository))' 5
.))5 6
ValidarData))6 A
())A B
filter))B H
,))H I
data))J N
.))N O
Email))O T
)))T U
;))U V
return** 
response** 
is** 
null** #
;**# $
}++ 	
},, 
}-- µ"
^C:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Utils\TimeHelper.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Utils "
{ 
public 

static 
class 

TimeHelper "
{ 
public 
const 
string 
REGIONID $
=% &
$str' >
;> ?
public 
static 
DateTime 
ConevrtirHora ,
(, -
string- 3
hora4 8
)8 9
{ 	
return		 
DateTime		 
.		 

ParseExact		 &
(		& '
hora		' +
,		+ ,
$str		- 4
,		4 5
null		6 :
)		: ;
;		; <
}

 	
public 
static 
bool 
ValidacionFecha *
(* +
string+ 1
fecha2 7
)7 8
{ 	
return 
ConvertirFecha !
(! "
fecha" '
)' (
.( )
Date) -
>=. 0 
ObtenerFechaColombia1 E
(E F
)F G
.G H
DateH L
;L M
} 	
public 
static 
DateTime  
ObtenerFechaColombia 3
(3 4
)4 5
{ 	
TimeZoneInfo 
zonaColombia %
=& '
TimeZoneInfo( 4
.4 5"
FindSystemTimeZoneById5 K
(K L
REGIONIDL T
)T U
;U V
DateTime 
today 
= 
TimeZoneInfo )
.) *
ConvertTime* 5
(5 6
DateTime6 >
.> ?
UtcNow? E
,E F
zonaColombiaG S
)S T
;T U
return 
today 
; 
} 	
public 
static 
long 
ObtenerMarcaTiempo -
(- .
). /
{ 	
return  
ObtenerFechaColombia '
(' (
)( )
.) *
Ticks* /
;/ 0
} 	
public 
static 
DateTime 
ConvertirFecha -
(- .
string. 4
fecha5 :
): ;
{ 	
try   
{!! 
var"" 
datos"" 
="" 
fecha"" !
.""! "
Split""" '
(""' (
$str""( +
)""+ ,
;"", -
int## 
year## 
=## 
int## 
.## 
Parse## $
(##$ %
datos##% *
[##* +
$num##+ ,
]##, -
.##- .
Split##. 3
(##3 4
)##4 5
[##5 6
$num##6 7
]##7 8
)##8 9
;##9 :
int$$ 
month$$ 
=$$ 
int$$ 
.$$  
Parse$$  %
($$% &
datos$$& +
[$$+ ,
$num$$, -
]$$- .
)$$. /
;$$/ 0
int%% 
day%% 
=%% 
int%% 
.%% 
Parse%% #
(%%# $
datos%%$ )
[%%) *
$num%%* +
]%%+ ,
)%%, -
;%%- .
TimeZoneInfo&& 
zonaColombia&& )
=&&* +
TimeZoneInfo&&, 8
.&&8 9"
FindSystemTimeZoneById&&9 O
(&&O P
REGIONID&&P X
)&&X Y
;&&Y Z
DateTime'' 
convertDate'' $
=''% &
new''' *
(''* +
year''+ /
,''/ 0
month''1 6
,''6 7
day''8 ;
)''; <
;''< =
DateTime)) 
fechaColombia)) &
=))' (
TimeZoneInfo))) 5
.))5 6
ConvertTime))6 A
())A B
convertDate))B M
,))M N
zonaColombia))O [
)))[ \
;))\ ]
return++ 
fechaColombia++ $
;++$ %
},, 
catch-- 
(-- 
	Exception-- 
)-- 
{.. 
return// 
new// 
(// 
$num// 
,//  
$num//! "
,//" #
$num//$ %
)//% &
;//& '
}00 
}11 	
}22 
}33 ”
bC:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\FxTemplateAzureSQL\Utils\SecurityHelper.cs
	namespace 	
FxTemplateAzureSQL
 
. 
Utils "
{ 
public 

static 
class 
SecurityHelper &
{ 
public		 
static		 
string		 
SHA256Encrypt		 *
(		* +
string		+ 1
text		2 6
)		6 7
{

 	
SHA256 
sha256 
= 
SHA256 "
." #
Create# )
() *
)* +
;+ ,
ASCIIEncoding 
encoding "
=# $
new% (
(( )
)) *
;* +
StringBuilder 
sb 
= 
new "
(" #
)# $
;$ %
byte 
[ 
] 
stream 
= 
sha256 "
." #
ComputeHash# .
(. /
encoding/ 7
.7 8
GetBytes8 @
(@ A
textA E
)E F
)F G
;G H
for 
( 
int 
i 
= 
$num 
; 
i 
< 
stream  &
.& '
Length' -
;- .
i/ 0
++0 2
)2 3
sb4 6
.6 7
AppendFormat7 C
(C D
$strD L
,L M
streamN T
[T U
iU V
]V W
)W X
;X Y
return 
$str 
+ 
sb 
. 
ToString %
(% &
)& '
.' (
ToUpper( /
(/ 0
)0 1
;1 2
} 	
public 
static 
string 
CalcularLlave *
(* +
)+ ,
{ 	
return 
SHA256Encrypt  
(  !
string" (
.( )
Concat) /
(/ 0
DateTime0 8
.8 9
Now9 <
.< =
ToString= E
(E F
$strF [
)[ \
,\ ]
Guid0 4
.4 5
NewGuid5 <
(< =
)= >
.> ?
ToString? G
(G H
)H I
)0 1
)1 2
;2 3
} 	
} 
} 