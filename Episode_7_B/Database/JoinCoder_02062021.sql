PGDMP             
            y         	   joincoder    13.2    13.2 "    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    33053 	   joincoder    DATABASE     m   CREATE DATABASE joincoder WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE joincoder;
                postgres    false            �            1255    57714    pro_left_menu(refcursor) 	   PROCEDURE     �   CREATE PROCEDURE public.pro_left_menu(INOUT get_result refcursor)
    LANGUAGE plpgsql
    AS $$
	begin
		open get_result for 
		select * from tbl_menu order by menuid;

	END;
$$;
 A   DROP PROCEDURE public.pro_left_menu(INOUT get_result refcursor);
       public          postgres    false            �            1255    57713 #   pro_left_menu(character, refcursor) 	   PROCEDURE     �   CREATE PROCEDURE public.pro_left_menu(profile character, INOUT get_result refcursor)
    LANGUAGE plpgsql
    AS $$
	begin
		open get_result for 
		select * from tbl_menu order by menuid;

	END;
$$;
 T   DROP PROCEDURE public.pro_left_menu(profile character, INOUT get_result refcursor);
       public          postgres    false            �            1255    49518 #   proc_get_menu(character, refcursor) 	   PROCEDURE     �   CREATE PROCEDURE public.proc_get_menu(profile character, INOUT get_result refcursor)
    LANGUAGE plpgsql
    AS $$
	begin
		open get_result for 
		select * from tbl_line;
	

	END;
$$;
 T   DROP PROCEDURE public.proc_get_menu(profile character, INOUT get_result refcursor);
       public          postgres    false            �            1255    41339 0   proc_user_login(character, character, refcursor) 	   PROCEDURE       CREATE PROCEDURE public.proc_user_login(usernam character, userpwd character, INOUT get_result refcursor)
    LANGUAGE plpgsql
    AS $$
	BEGIN
		
		open get_result for 
		select * from tbl_userlogin as u where u.user_login=usernam and u.user_pwd=userpwd;
		
	END;
$$;
 i   DROP PROCEDURE public.proc_user_login(usernam character, userpwd character, INOUT get_result refcursor);
       public          postgres    false            �            1259    41270 
   tbl_branch    TABLE       CREATE TABLE public.tbl_branch (
    branchcode character varying(10) NOT NULL,
    branchname character varying(250) NOT NULL,
    shortname character varying(100) NOT NULL,
    active character varying(10) NOT NULL,
    inputer character varying(250),
    inputdate date
);
    DROP TABLE public.tbl_branch;
       public         heap    postgres    false            �            1259    41278 	   tbl_items    TABLE     X  CREATE TABLE public.tbl_items (
    ite_id character varying(10) NOT NULL,
    branchcode character varying(10) NOT NULL,
    ite_name character varying(250),
    cost money,
    discount money,
    unitpirce money,
    active character varying(10),
    inputer character varying(250),
    inputdate date,
    typ_code character varying(10)
);
    DROP TABLE public.tbl_items;
       public         heap    postgres    false            �            1259    41294    tbl_line    TABLE     �   CREATE TABLE public.tbl_line (
    lin_id character varying(10) NOT NULL,
    branchcode character varying(10) NOT NULL,
    lin_name character varying(250),
    active character varying(10),
    inputer character varying(250),
    inputdate date
);
    DROP TABLE public.tbl_line;
       public         heap    postgres    false            �            1259    57710    tbl_menu    TABLE     �   CREATE TABLE public.tbl_menu (
    menuid character varying(50),
    menu_name character varying(250),
    inactive character varying(10),
    menu_action character varying(150)
);
    DROP TABLE public.tbl_menu;
       public         heap    postgres    false            �            1259    41310    tbl_purchaseorder    TABLE     `  CREATE TABLE public.tbl_purchaseorder (
    sysdocnum character varying(10) NOT NULL,
    branchcode character varying(10) NOT NULL,
    ite_id character varying(10),
    sup_id character varying(10),
    cost money,
    qty bigint,
    discount money,
    amount money,
    totalamount money,
    inputer character varying(250),
    inputdate date
);
 %   DROP TABLE public.tbl_purchaseorder;
       public         heap    postgres    false            �            1259    41302 
   tbl_supply    TABLE     H  CREATE TABLE public.tbl_supply (
    sup_id character varying(10) NOT NULL,
    branchcode character varying(10) NOT NULL,
    sup_name character varying(250),
    sup_phone character varying(100),
    sup_email character varying(100),
    active character varying(10),
    inputer character varying(250),
    inputdate date
);
    DROP TABLE public.tbl_supply;
       public         heap    postgres    false            �            1259    41318    tbl_transactions    TABLE     �  CREATE TABLE public.tbl_transactions (
    sysdocnum character varying(10) NOT NULL,
    branchcode character varying(10) NOT NULL,
    trandate date,
    ite_id character varying(10),
    sto_id character varying(10),
    trancode character varying(10),
    qty bigint,
    total_qty bigint,
    referent character varying(250),
    inputer character varying(250),
    inputdate date
);
 $   DROP TABLE public.tbl_transactions;
       public         heap    postgres    false            �            1259    41286    tbl_type    TABLE       CREATE TABLE public.tbl_type (
    typ_id character varying(10) NOT NULL,
    branchcode character varying(10) NOT NULL,
    typ_name character varying(250),
    lin_id character varying(10),
    active character varying(10),
    inputer character varying(250),
    inputdate date
);
    DROP TABLE public.tbl_type;
       public         heap    postgres    false            �            1259    41326    tbl_userlogin    TABLE     O  CREATE TABLE public.tbl_userlogin (
    user_id character varying(10) NOT NULL,
    branchcode character varying(10) NOT NULL,
    user_login character varying(250),
    user_name character varying(250),
    user_pwd character varying(250),
    contact character varying(100),
    inputer character varying(250),
    inputdate date
);
 !   DROP TABLE public.tbl_userlogin;
       public         heap    postgres    false            �          0    41270 
   tbl_branch 
   TABLE DATA           c   COPY public.tbl_branch (branchcode, branchname, shortname, active, inputer, inputdate) FROM stdin;
    public          postgres    false    200   �.       �          0    41278 	   tbl_items 
   TABLE DATA           �   COPY public.tbl_items (ite_id, branchcode, ite_name, cost, discount, unitpirce, active, inputer, inputdate, typ_code) FROM stdin;
    public          postgres    false    201   -/       �          0    41294    tbl_line 
   TABLE DATA           \   COPY public.tbl_line (lin_id, branchcode, lin_name, active, inputer, inputdate) FROM stdin;
    public          postgres    false    203   J/       �          0    57710    tbl_menu 
   TABLE DATA           L   COPY public.tbl_menu (menuid, menu_name, inactive, menu_action) FROM stdin;
    public          postgres    false    208   �/       �          0    41310    tbl_purchaseorder 
   TABLE DATA           �   COPY public.tbl_purchaseorder (sysdocnum, branchcode, ite_id, sup_id, cost, qty, discount, amount, totalamount, inputer, inputdate) FROM stdin;
    public          postgres    false    205   �/       �          0    41302 
   tbl_supply 
   TABLE DATA           t   COPY public.tbl_supply (sup_id, branchcode, sup_name, sup_phone, sup_email, active, inputer, inputdate) FROM stdin;
    public          postgres    false    204   0       �          0    41318    tbl_transactions 
   TABLE DATA           �   COPY public.tbl_transactions (sysdocnum, branchcode, trandate, ite_id, sto_id, trancode, qty, total_qty, referent, inputer, inputdate) FROM stdin;
    public          postgres    false    206   /0       �          0    41286    tbl_type 
   TABLE DATA           d   COPY public.tbl_type (typ_id, branchcode, typ_name, lin_id, active, inputer, inputdate) FROM stdin;
    public          postgres    false    202   L0       �          0    41326    tbl_userlogin 
   TABLE DATA           z   COPY public.tbl_userlogin (user_id, branchcode, user_login, user_name, user_pwd, contact, inputer, inputdate) FROM stdin;
    public          postgres    false    207   �0       M           2606    41277    tbl_branch tbl_branch_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tbl_branch
    ADD CONSTRAINT tbl_branch_pkey PRIMARY KEY (branchcode);
 D   ALTER TABLE ONLY public.tbl_branch DROP CONSTRAINT tbl_branch_pkey;
       public            postgres    false    200            O           2606    41285    tbl_items tbl_items_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tbl_items
    ADD CONSTRAINT tbl_items_pkey PRIMARY KEY (ite_id, branchcode);
 B   ALTER TABLE ONLY public.tbl_items DROP CONSTRAINT tbl_items_pkey;
       public            postgres    false    201    201            S           2606    41301    tbl_line tbl_line_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tbl_line
    ADD CONSTRAINT tbl_line_pkey PRIMARY KEY (lin_id, branchcode);
 @   ALTER TABLE ONLY public.tbl_line DROP CONSTRAINT tbl_line_pkey;
       public            postgres    false    203    203            W           2606    41317 (   tbl_purchaseorder tbl_purchaseorder_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.tbl_purchaseorder
    ADD CONSTRAINT tbl_purchaseorder_pkey PRIMARY KEY (sysdocnum, branchcode);
 R   ALTER TABLE ONLY public.tbl_purchaseorder DROP CONSTRAINT tbl_purchaseorder_pkey;
       public            postgres    false    205    205            U           2606    41309    tbl_supply tbl_supply_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tbl_supply
    ADD CONSTRAINT tbl_supply_pkey PRIMARY KEY (sup_id, branchcode);
 D   ALTER TABLE ONLY public.tbl_supply DROP CONSTRAINT tbl_supply_pkey;
       public            postgres    false    204    204            Y           2606    41325 &   tbl_transactions tbl_transactions_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.tbl_transactions
    ADD CONSTRAINT tbl_transactions_pkey PRIMARY KEY (sysdocnum, branchcode);
 P   ALTER TABLE ONLY public.tbl_transactions DROP CONSTRAINT tbl_transactions_pkey;
       public            postgres    false    206    206            Q           2606    41293    tbl_type tbl_type_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tbl_type
    ADD CONSTRAINT tbl_type_pkey PRIMARY KEY (branchcode, typ_id);
 @   ALTER TABLE ONLY public.tbl_type DROP CONSTRAINT tbl_type_pkey;
       public            postgres    false    202    202            [           2606    41333     tbl_userlogin tbl_userlogin_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tbl_userlogin
    ADD CONSTRAINT tbl_userlogin_pkey PRIMARY KEY (user_id, branchcode);
 J   ALTER TABLE ONLY public.tbl_userlogin DROP CONSTRAINT tbl_userlogin_pkey;
       public            postgres    false    207    207            �   L   x�3040�����s���V(.�/J��r
�4����q��4202�50�52�2040��H,(�THB����>F��� &��      �      x������ � �      �   M   x�3000�40N��ٜ���!z��!���1~\Fɀ�<�\0B�.����E�"T��Z�-R@�=... sPr      �   >   x�3�tLIQ�,I��4�t+ʍOLI��r��8������\ƜA��E%P�"0�+F��� Ê      �      x������ � �      �      x������ � �      �      x������ � �      �   D   x�3000�40~�e�9� �!�gg��c�tK�+I,�Đ6�H{���dC�S�@�1z\\\ ���      �   U   x�30404000�R��Y��y��)�E鹉�9z����^@1g����1H������1�g�^pdp��/����������!W� �~     