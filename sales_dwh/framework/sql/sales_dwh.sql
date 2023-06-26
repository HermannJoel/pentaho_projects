/*==============================================================*/
/* Nom de SGBD :  oracle                   */
/* Date de création :  10/01/2022             */
/*==============================================================*/


/*==============================================================*/
/* Table : DIM_COLLABORATEUR                                    */
/*==============================================================*/
create table DIM_COLLABORATEUR (
   ID_I_COLLABORATEUR   INTEGER     not null,
   ID_I_TYPE_COLLAB     INTEGER     null,
   CD_V_IDENT_COLLAB   VARCHAR2(20)    null,
   LB_V_PRENOM_COLLAB  VARCHAR2(250)     null,
   LB_V_NOM_COLLAB      VARCHAR2(250)  null,
   DT_D_NAISSANCE       date         null,
   CD_V_ACTIF           varchar(20)          null,
   constraint PK_DIM_COLLABORATEUR primary key (ID_I_COLLABORATEUR)
)
;
/*==============================================================*/
/* Index : FK_RELATION_39                                       */
/*==============================================================*/
create index FK_RELATION_39 on DIM_COLLABORATEUR (
ID_I_TYPE_COLLAB ASC
)
;
/*==============================================================*/
/* Table : DIM_SERVICE                                          */
/*==============================================================*/
create table DIM_SERVICE (
   ID_I_SERVICE         INTEGER        not null,
   ID_I_SOCIETE        INTEGER          null,
   CD_V_SERVICE         varchar(20)          null,
   LB_V_SERVICE         varchar(250)         null,
   constraint PK_DIM_SERVICE primary key  (ID_I_SERVICE)
)
;
/*==============================================================*/
/* Index : FK_RELATION_40                                       */
/*==============================================================*/
create index FK_RELATION_40 on DIM_SERVICE (
ID_I_SOCIETE ASC
)
;

/*==============================================================*/
/* Table : DIM_SOCIETE                                          */
/*==============================================================*/
create table DIM_SOCIETE (
   ID_I_SOCIETE         INTEGER          not null,
   CD_V_SOCIETE         varchar2(20)          null,
   LB_V_SOCIETE         varchar2(250)         null,
   constraint PK_DIM_SOCIETE primary key  (ID_I_SOCIETE)
)
;

/*==============================================================*/
/* Table : DIM_TYPE_COLLABORATEUR                               */
/*==============================================================*/
create table DIM_TYPE_COLLABORATEUR (
   ID_I_TYPE_COLLAB     INTEGER       not null,
   CD_V_TYPE_COLLAB     varchar2(20)          null,
   LB_V_TYPE_COLLAB     varchar2(250)         null,
   constraint PK_DIM_TYPE_COLLABORATEUR primary key (ID_I_TYPE_COLLAB)
)
;
/*==============================================================*/
/*----         Table : FAIT_EFFECTIFS                       ----*/
/*==============================================================*/
create table FAIT_EFFECTIFS (
   ID_I_COLLABORATEUR   INTEGER          not null,
   ID_I_SERVICE        INTEGER         not null,
   NB_I_COLLAB          int                  null,
   NB_I_AGE_COLLAB      int                  null,
   constraint PK_FAIT_EFFECTIFS primary key (ID_I_COLLABORATEUR, ID_I_SERVICE)
)
;
/*==============================================================*/
/*----         Index : FK_FAIT_EFFECTIFS                    ----*/
/*==============================================================*/
create index FK_FAIT_EFFECTIFS on FAIT_EFFECTIFS (
ID_I_COLLABORATEUR ASC
)
;

/*==============================================================*/
/*----          Index : FK_FAIT_EFFECTIFS2                 ---- */
/*==============================================================*/
create index FK_FAIT_EFFECTIFS2 on FAIT_EFFECTIFS (
ID_I_SERVICE ASC
)
;


alter table DIM_COLLABORATEUR
   add constraint FK_DIM_COLL_RELATION__DIM_TYPE foreign key (ID_I_TYPE_COLLAB)
      references DIM_TYPE_COLLABORATEUR (ID_I_TYPE_COLLAB)
;

alter table DIM_SERVICE
   add constraint FK_DIM_SERV_RELATION__DIM_SOCI foreign key (ID_I_SOCIETE)
      references DIM_SOCIETE (ID_I_SOCIETE)
;

alter table FAIT_EFFECTIFS
   add constraint FK_FAIT_EFF_FAIT_EFFE_DIM_COLL foreign key (ID_I_COLLABORATEUR)
      references DIM_COLLABORATEUR (ID_I_COLLABORATEUR)
;

alter table FAIT_EFFECTIFS
   add constraint FK_FAIT_EFF_FAIT_EFFE_DIM_SERV foreign key (ID_I_SERVICE)
      references DIM_SERVICE (ID_I_SERVICE)
;

