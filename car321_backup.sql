PGDMP     0                    {            cars_321 #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1) #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1) '    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    16688    cars_321    DATABASE     ]   CREATE DATABASE cars_321 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE cars_321;
                ojik    false            A           0    0    cars_321    DATABASE PROPERTIES     2   ALTER DATABASE cars_321 SET "DateStyle" TO 'MDY';
                     ojik    false            �            1255    16826    generate_dummy_bids(integer)    FUNCTION     G  CREATE FUNCTION public.generate_dummy_bids(n integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  ad_count INTEGER;
  user_count INTEGER;
BEGIN
  SELECT COUNT(*) INTO ad_count FROM advertisements;
  SELECT COUNT(*) INTO user_count FROM users;
  
  FOR i IN 1..n LOOP
    INSERT INTO bids(bid_status, bid_price, ads_id, user_id)
    VALUES(
      CASE random() < 0.5 WHEN true THEN 'accepted' ELSE 'pending' END,
      (random() * 100000)::integer,
      (floor(random() * ad_count) + 1)::bigint,
      (floor(random() * user_count) + 1)::bigint
    );
  END LOOP;
END;
$$;
 5   DROP FUNCTION public.generate_dummy_bids(n integer);
       public          ojik    false            �            1259    16716    advertisements    TABLE       CREATE TABLE public.advertisements (
    ads_id bigint NOT NULL,
    title character varying(100),
    brand character varying(30),
    model character varying(30),
    body_type character varying(30),
    engine_capacity numeric(10,8),
    manufacturing_year integer,
    mileage integer,
    transmission_type character varying(10),
    color character varying(30),
    price integer,
    date_post date,
    date_update date,
    is_bid_allow boolean,
    ads_status character varying(10),
    user_id bigint,
    location_id bigint
);
 "   DROP TABLE public.advertisements;
       public         heap    ojik    false            �            1259    16715    advertisements_ads_id_seq    SEQUENCE     �   CREATE SEQUENCE public.advertisements_ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.advertisements_ads_id_seq;
       public          ojik    false    214            B           0    0    advertisements_ads_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.advertisements_ads_id_seq OWNED BY public.advertisements.ads_id;
          public          ojik    false    213            �            1259    16733    bids    TABLE     �   CREATE TABLE public.bids (
    bid_id bigint NOT NULL,
    bid_status character varying(10),
    bid_price integer,
    ads_id bigint,
    user_id bigint
);
    DROP TABLE public.bids;
       public         heap    ojik    false            �            1259    16732    bids_bid_id_seq    SEQUENCE     x   CREATE SEQUENCE public.bids_bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bids_bid_id_seq;
       public          ojik    false    216            C           0    0    bids_bid_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.bids_bid_id_seq OWNED BY public.bids.bid_id;
          public          ojik    false    215            �            1259    16697 	   locations    TABLE     �   CREATE TABLE public.locations (
    location_id bigint NOT NULL,
    city character varying(60),
    latitude numeric(10,8),
    longitude numeric(11,8)
);
    DROP TABLE public.locations;
       public         heap    ojik    false            �            1259    16696    locations_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.locations_location_id_seq;
       public          ojik    false    210            D           0    0    locations_location_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;
          public          ojik    false    209            �            1259    16704    users    TABLE     �   CREATE TABLE public.users (
    user_id bigint NOT NULL,
    name character varying(100),
    contact bigint,
    email character varying(60),
    address character varying(100),
    location_id bigint
);
    DROP TABLE public.users;
       public         heap    ojik    false            �            1259    16703    users_user_id_seq    SEQUENCE     z   CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          ojik    false    212            E           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          ojik    false    211            �           2604    16719    advertisements ads_id    DEFAULT     ~   ALTER TABLE ONLY public.advertisements ALTER COLUMN ads_id SET DEFAULT nextval('public.advertisements_ads_id_seq'::regclass);
 D   ALTER TABLE public.advertisements ALTER COLUMN ads_id DROP DEFAULT;
       public          ojik    false    214    213    214            �           2604    16736    bids bid_id    DEFAULT     j   ALTER TABLE ONLY public.bids ALTER COLUMN bid_id SET DEFAULT nextval('public.bids_bid_id_seq'::regclass);
 :   ALTER TABLE public.bids ALTER COLUMN bid_id DROP DEFAULT;
       public          ojik    false    215    216    216            �           2604    16779    locations location_id    DEFAULT     ~   ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);
 D   ALTER TABLE public.locations ALTER COLUMN location_id DROP DEFAULT;
       public          ojik    false    209    210    210            �           2604    16707    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          ojik    false    212    211    212            8          0    16716    advertisements 
   TABLE DATA           �   COPY public.advertisements (ads_id, title, brand, model, body_type, engine_capacity, manufacturing_year, mileage, transmission_type, color, price, date_post, date_update, is_bid_allow, ads_status, user_id, location_id) FROM stdin;
    public          ojik    false    214   d/       :          0    16733    bids 
   TABLE DATA           N   COPY public.bids (bid_id, bid_status, bid_price, ads_id, user_id) FROM stdin;
    public          ojik    false    216   UA       4          0    16697 	   locations 
   TABLE DATA           K   COPY public.locations (location_id, city, latitude, longitude) FROM stdin;
    public          ojik    false    210   �F       6          0    16704    users 
   TABLE DATA           T   COPY public.users (user_id, name, contact, email, address, location_id) FROM stdin;
    public          ojik    false    212   	j       F           0    0    advertisements_ads_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.advertisements_ads_id_seq', 1, false);
          public          ojik    false    213            G           0    0    bids_bid_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.bids_bid_id_seq', 1, true);
          public          ojik    false    215            H           0    0    locations_location_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);
          public          ojik    false    209            I           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
          public          ojik    false    211            �           2606    16721 "   advertisements advertisements_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.advertisements
    ADD CONSTRAINT advertisements_pkey PRIMARY KEY (ads_id);
 L   ALTER TABLE ONLY public.advertisements DROP CONSTRAINT advertisements_pkey;
       public            ojik    false    214            �           2606    16738    bids bids_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (bid_id);
 8   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_pkey;
       public            ojik    false    216            �           2606    16781    locations locations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            ojik    false    210            �           2606    16709    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            ojik    false    212            �           2606    16787 .   advertisements advertisements_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.advertisements
    ADD CONSTRAINT advertisements_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);
 X   ALTER TABLE ONLY public.advertisements DROP CONSTRAINT advertisements_location_id_fkey;
       public          ojik    false    214    210    3228            �           2606    16722 *   advertisements advertisements_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.advertisements
    ADD CONSTRAINT advertisements_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 T   ALTER TABLE ONLY public.advertisements DROP CONSTRAINT advertisements_user_id_fkey;
       public          ojik    false    212    214    3230            �           2606    16739    bids bids_ads_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_ads_id_fkey FOREIGN KEY (ads_id) REFERENCES public.advertisements(ads_id);
 ?   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_ads_id_fkey;
       public          ojik    false    3232    214    216            �           2606    16744    bids bids_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 @   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_user_id_fkey;
       public          ojik    false    3230    212    216            �           2606    16782    users users_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT users_location_id_fkey;
       public          ojik    false    210    212    3228            8      x��\�r7}�|w�,��<R"-�&eI)ڭ}ɴ�M�x����m`�\fH&U�J��ʭ���ӧ{���L�R��~wx^�^���[���آ��f�Cw�Xm��z��[�&st�X�kDJ�����
��br�X�ɲ����4!��j}�V���|0A���"e��%�(�{��y�.����������=,�o�ح�T�|�s���`�Bw����a����!�}�l�s��p4�V��~�0g��Cj�*�R���~��/_����Z`Y��VvQ���b_���Ԗrn-%�0^�l֟*t�]n���|t�F`�*�Ws�0���j���\����@Yh��܉&�m�Z`LT�J�<b����6P0k 'TPo����f�~���_�I鍄��m×1U�<.��C��ࡉ��m� 	=7[C�b7��z8p�; �M����o�a�~�X|C�-	�������ˇ��x{�aI��<V�
�t�ų��G�j�qQ.�_G����f��C���CD޲ȭ��j����88���p0��̠�cd���I�[)�$��Q��W�Yl7�~�~4��f�S�`����)bO)0�0F��ͪ�Ԋ0���Yƕ(� �d�����������~��qqU�~VhV��W[$�-{��J nX����u��VK�2���#�,����*|��2a��y��s����������ŧjC�a�8d���uz}����� IZ�mZ�q���[TѮ�0��X|��a�ֳ�*��Q0'�7A�,)
�x(@
�~�X���#��Bs�㧼t�bg�p��DV@��8�Ʒ2$��X���Y�%"сGg�m��o�{����y�  ?��7�'�~0H���������;�M
?�=���>�o�İ�#�cp�]�$���_��t����σ�"�@6���fjW?�5�@L/��#���9�C�h����N[yӒ���cV��K����LW{%/c�A�k�S�6�QW �c����R���%�?엯�4�)��#�p*j���|��v]oM�47=�^�U�]��X-?�s��p+�gi�]��թ#�� ���P�S� "Vw����^8�3KV<H�WQ���	�NiJƷh�V�
*2�,m}��AL��B_�.�L~=�oc����u���D�h����Ww�ݮZ;T��yk(��9�f�ڞ,��r��!��-W��[y_�~���f1�u���������k�CO���BHSe�YZ|rg
{��dJSjx�Ůe/I�[�� ���d4�܀X^�@��/��o>����be$�՛��;��}h�Y�ݎG�BQ�_)VKw�\���i��o��w?y��Y�\�D��Zf�%rB��7ŭO�l�q ����'�����C��O3��O&����S4E�! �^�����_Y�2U��#b �I�8D@�@�l�0A��p����y���uX�$ĩV�_0��(��� �4iKW�K�ܫJ��-�^�'-��6-r˳���0UIu�v�Կa�%bN�]�1�c�A{|�_,m�M�K�ڃ�8�佚���6M50��7	�QV��@X�^6;��9x`�<|�J���d�Ov��`mȊc,sh�^i� Y�FB)������2E��tVV��zy�8�p�0���PhR�ؚ-�l+{�
����){��5�aVu��:�lP���0ǯ��}�����%($v`�[�1㤟:��@��1p�p�76�����f���=VY�+=)4��,�������G�
,��5w0��q"ϧO�j������b�B J���K<O5^p>�Y�?��r�x[��$u_x��ӝ�
6���rN��Ҁ�<D�<�}������y�t�ʟ6�>�����<����2ϫ+D��.��l��o0%�,��~Mʳ Ǆ�m!MR>��&���0�Z��Z�v�ʖS�������m��ɲ�V��$jYdh�c��P)}�I���ܮכ�k����ȍ&�tP"qL�N�Vh�*�	i���� lŉ�u�˸�� #X��Y+ꢸ�+v��rՅׇ�~	D�����,��kA=jqL*��Hr��Em*��xb�V ��G+ |�HW�)��ė��4N�:ʌ���I-�'q��1���|I��NSA-׏EI�:?X��w��ڣM�gb�J�P�uM�e|�&��4_ �ء�SW�o�R}���C9b:3/�	2�$����B��x��>�ŲgKp���B��2M�#�vA�$^�#Jړ���������˦�s���㬪�bi�c�FM�\�$�=��R33�L�F ��`4��R]�)��w�a�n�P"�-V�q<�-;b� RD*�r��/̄�x:�n`j6�R�;3���QѸ�\�F�\> ���CcC�hmN���6�^�oKw+��������������c=G�(O�:ġ�{s�>}������Эt�LFpl!n��F(��y�[u"T�Y�b`l�X?�������Q󛣻��)?�-�

�s����i�G��󬃏�})N���<�'���mJPyڏ�2U�0�R���~dH��PJy�G�}�]�E7��=��0��$g��F�+��`=ٛ����s �\���N� �9d��ۇI�-�!��Z,��)��A�0���5����Y����{6F�F|�p�.�G��;0� I���tW?��>�ԵcbŌf��b��U�����p�P�}ɓVxK=}9x?hÖ�̲�Qa�"�j�ڣ1
��w�S�7���=��e����k=�4�W�?���'���qSS ���$�cEe�;lD؎6�sR�afZ�����v�d�4Nu�xd�I����c�xd<��5+����ɮY1�F�D����n
?�W:$��6��am��1��4.�إ�B���KM
"	χA�Ϸ4��|�n�|�}��s�[����۬���ϝ���Ĳ5ѡh�x]����$>M�C�X�h1;/֗8�q]zA��y!�l������M*^΋]I��w�4��@�Si<�o]P����k"�P�6�ܾ<4SdF�q �.U�'�g�h�	��':^�3Mi�y4t9,P�V����^�&��� f�;��P\�#6�)�W���!/�-#w4)v�y�  te���������O	2������z�du�o��	��u���/�1I�E��.��BXP/J��͒7=�U���l��ՓMj��H<���;�E�0��[�e��ՐP���@\j/�6�g������~u�����ð���y��RL��юi�����&�u%ͳY{2���{��:�=��o�S��I"%'���eÑ;�K�֞���/\��H�bN�	��sy�d�OHv�u	���#+d�n�}-+�����n�_��9�c��J�'�� hHy�_�&m �ȅ	�eX6�%W�����n����)�g@]�%�D�/3ɻeZ4*��͹�yV�@u��y"��$%Ab��ۊ'��~MD�����tKy	��1���Bp@K�ձ��Q�0�F�K�٢� �
����U���|S�́�n�J�2b.��3S��F7����M�!�$�"���g1�3y�ɲʦ	����5~>��������R�H�}9k��L꒥�:�s���⃓#9�iL��
v�Ҟ�<Se!5+O,MSe��F�y��L�ϰ�8eg��Ȑ��yW>�kiu*�%{�f��On��.,����.!]OG�;4�
_��|)Z�$;�՟�i*�9h4�.	�Y��j�]{���QR�)��r6�0��2y�VM��d"�Ao)�ݒ��j� V����Iyj�mn� �oK�q_F�X���"x)ͤ-�z�D����"Q�v�	Y+_�-%MVKMlo�^S��mDݿ�=D����ca�=���A�_�B��ݻ3a���J�t�o�]XE��B��k��k�}"�(��B��&���=f*�|��hІ���7M���Ә��jf�����{�6P �d� c7��U��1�=��=!������uz13f���:�è�Nߚ1�I �  �����j\�������䉡m��mW�2���/�[��r�fsO�C�����LGb�r�U�)N�qt��s4�q?��`�uql����$��Iҁ6����m�����-��\�T������Mϵ[�r��:�{�b���b�?ly!�gl\���&#gI.�i0�5���r�؟ٛ>�Nc�x)<�p�����Kz��:��L/����ouD�Hx��~��:��z_���~j��L����trl�/ysR��&�B�N��������ʎ�T�#�D�$���e�g:Z`e,w��2�_A��E��`~us9����_��9�>E;�ETA�t}B��^��Ǆ��R*^ә��0ӿ�9��*$e�ci�����c�W�o��{)����)�4�������idg�o)zy9�=�0�h����A!Sa)P��ʴ'"F�t��U^�a�8��M�
�]���-��4�����r��D�jJ0�����~���q��      :   5  x�]W͊&7<�0����%�@ YHy���m�;��e�F��U%5��?�����o��p7���S}h�1������A����d2��br�������1�1�6B��Be]ȳA
�?����/�~҈�]/�`!���ee� 3�M���	�$vaFQRmL�Bb5|bݧ�*DĪ%}�YI$���^���w���K�6�d\�y��v�]��]AfY�^E�A|�D�������߅d�g�1�c�WՔ�I91�8ӍS�m�F�l�>�E�U8��,6$|��<��X�2�;VS2����oF��0,[V:�zxg�E�㖂�X����=�f�':A�y�ƫ�L��|��F��KhkfL��0��e
�����C�CX�1Z�cL�C<(�B����X���"�8�e����TR�����{��8�Z�޹u�$HM<׶��)�Օ����8L?��<O�ݥ`
u��>��:r���휹o8s?�G����r���D_�`��;�6�}G��WH��U�Ao�4'f�ަ�͖h�m��C�r*��>J��`BN���N|S5\��|�������4�FFKͧ>rgF�D��`��=�R�j�M�wWz��������tZ��S�@O��M�Ve���Z��:AtSng�WI��n�) ��WS�R�8��a�I��[��˼�28M� p5����	�D!�E��_���P{���-u��~����t2�����۞��JЗ-�&��WM�3��@�zw��eb^��.�^W�E�Ў�J%������3d
2	[���D����@������M��x�DO�1��A�����u��=�Xf� �}d_�r��k��t*^OY� mQ�����l]3j�wҸB�<ޮ���?����-�K��i�ނJ��8c�[��
x�k9c���z?��#y��.e��H�)Aޭ�6�5�|�p㋧9Wc�QĈ�+��}t�O�4-��c��e�aˁE����ڟZ2�)� �3���Ġ�A#�H쵯�g
!v�`~{��M�R6��OK�y5V��)��iGa4��fRN�N�c�t��E{Jē�X?�j��{�����*��6jYkE���Z�������v{���E�4���l̑<�҉����968l���F��v��V/��-:O��?��&!���	cfpC��	ۋ��q��ys}�D!�7�*q���s��^%�J�>]���yc^��[�O��9������䘔�,��hH�O��U�Ɏ(��5�nC�,��O�r��ȏ!P���2�չ��;�j�岤׆�'\�4�/��<��޴�&�J��?}}}��OC�      4      x�m\�n9�}��
����N>�㞮��k�r5�K��s��K
W���s�IF�U�ن��ˉ��#~e;��s�v�a�N/w��ݯ�����+!�b(�>�,����<F�Tro�}#7�zE���<]w�po��M%��������\���C��.��	uة�Χ�e���;�+�Pҽ��!6��r8.������bn���v�?��2]}�6���C��c�Q�77��r��u��s�};�3F����}�۔2*�.c�X�۵����i+HN�hi����)G�!k��2|�.��]e�u}�p�g�	X�e����|��<_Yo�M����)7|X��6_������M2�&���ߧ�ݧm~�#�-k3wֹЩ����y�g��%nl�%:��������y;O�s_����-7΍jS���t����b	�O��6o��HYI×�q�o���h�Fa]����Ky�]�JN�m���C��}�����@������y�N�ܥ���:�RLE�u�������i:�[��5�o�	�O�H�v�OsW�w�ޘf2����x������4U@c�<�q�m"��E'���whۏn0@\.�S;H�(�f�e>?\����.���}�E�ʚ4���v9ԙ�f_hlcK���܉/��B�>��y"��kA�i����S�>��-�A�b���	�8nj�-y��~�%�����K�<:�6��a�I��I��w���e�Ə.a���Ƣ�s�U�w�ŊE1�Τm>L�����d����"�������=I�ZJre����/ng�P+c�0y9�#D΀ؤ�'d0>o-~�/��t�e������V�LT�/��?��|X/�:�<9��ش(j���i~��m�k�����'��q�4���pb��L�^M%��La�:_51<��эIlC�Lܦ��71"�h}���n��/J�}��m|�YdQ�!+#�GE�b��rr��%�<�5G�d&�9m���8�6N=�bS [B~+�p� ��l�7�݈7>����屩�cQ���$�3�Ê�g2L,����&��)r� ���i�&�C����t�+��ު�a���y�c�����q=�GT��6��+V������&��>Fky>�Vuv�c�	Η;Fk���99�_��|n�a"�ݱka�17&#�/�݇�4G8�X�8�v�#f��z]//�I���� }Y���I�@�}sex3�f�ȕ(����H�)�J���/��uz�a|ר��$ ����8]_�����hYo�U��&��=7�=�YvZ����Mm�^Ʊ�qɰs��0C5ՕAbrX�E�2yݞ:2[#�[�P�M$��iڠ�0b��6�²J�pE�^���i�~��K8mI�v�mvF8ܰ���G5��q�|\�/��ai&�cG7���5�s�.�?e�9���0X0Y2��j��!���N^r�}��N���M�}�7'S�����L���` =��6��&�+�O�m`_����|پ�������-QK&�r�N~�����X���I9�"�Ȑ߁AaRy�H铠QHE�Y��K�R�L�c���Kq@��1�&usMŤ& W�a"Ӧ�P��"RIc7o��`e"�ǎ��"���#�X	n��;q���9�Z%Y9/����z���������ӶqC�{ 8b��1 � n1�������Ԍ�H��+S�4D\קD������9ތ���0�����"�3�'�+��C;�nc[����	��?�O�i=d��E��Ht8f��������h$��������u:O?6�u�Ƽ}n,o_��UK����+��D!�;�bVб�(��8�yB�%�7f�u�,4�(�s���)ц���O�'f�o$�&uH�l��6���{q��YM�S,�g�s���_��4�����,�`���(6���j��6	�.�Y"&��<?�ɤ�#����Q-5��=/�3b���r ���9p.ڛ�[�n-|I|��	�F�i�̒-"�0v[ௌQ���-��!&7�Z�C������r>8 �Ӫ�a\�Mc0���!N\�ߜ&�؛�Fo�@;�\��,��6V�b|Tą"����I�Mf�"�'��#���"��M�L~�*Z������~`"%{��s�*S�g�̯J���L�!�7*��]O�\9��pL��ig��,���N|:�@� j���ܔ�0��F������#��y��Y��m�۳X�1�fo��E��8�'-R0G��a�Qar���)��ؑɁx��|�^D�Ә�?� �*������i���7*c��S
\s��=R�ET-jP�X��Lʬ�H�vrD�J3�6>@!(�+��M�
�G)��a���u��2}K7��U������ƚ��� �%�B�Ӌɿ,e���,��28���U���D��ҜQ���i�Yl�KIM��
A��BP�So�@r;$2�����[ˤ�.;�e�v��&`E�D��3��A+">>U�ʺ��i���	��t2�P@{Ǝ6�� ���%�f�ÿ��zX�bDK�1��cW�:M%^V�*r`�b��KK�A����Pzī�tw�Bhc������Wcf3c��m��y�-����M7�����,0�L�:�~�2na�`��ثi#`X�����wǾ�9�S���������}7��b+k&�k���2x�g��V�z5�=�u�ۮ����(�q�e�5Z�(,��c�l�Z)�ˏ$-Lt�}.b7�vv/𾝚�ǷRZ%F�ie�<|�λm�e��u��vM_�O !�'��si�5މu1����M�#7��6@Yl�/&nr^�K��,�z��I;Q]�v>�0��?���%rFG��5B��Qb�&b�7|���˪<�s��٤���1����?��(�)��7e/Y"C5���*f��2��>��#��ˋ*DPɕ��  ��L�>Sتv�Yy<0��lM~?o���bL}�Qf��A������}�\�Gp�����z�M�1��y�fW �U�|n�)*L��(J��-G�8��#���2��'-c0QF�wA`��"��VW'���$�l�*�-/��/��̦d�-��Q�e,MZ`�҅Q�;kvO���eb20|j;��ǵ��O�Q̀O�E�0�Z-B$
iF+����J�y7*�M]Q�����Tု��z̾3���Q�u�^R�6R=�iC$�s�;��YHBfi+�K
;���u ��u��1A�x��	_&%���,>;�M#� �aS�im��@Hk%?k��2�c�~�{0+ᝮ��$�F���Iꤲ�*��2]��6��l��8����&x��ﰻ�c�]���J�x�M�Np)��0k�(�8�(�I�;1Lmi	�=�_ �8v,����].c�j7p4B(�;P���huN*[�k�s�QZ�cGR�4b�m���UJ`>Į�J��cc8O�˅9 H���(��㺐�ٰ���ݶ�'�)�$^U�e�oKm�ZA���\s��S�W�ȡL�Ƚ����b�IJN�>��� �O^i��L�����v~�x%>[ˇQtVίq|�8��h=����:%����O��ZK�/�SiT�����n�ʆ�_�.�ƈԙn�ࣱ�n ��Xrgyc����ڭ��֖��ۅ,�gN�{�ʾS��n�pc������#�0PM��^!�T*a���Uw��U*^��Z
��e�g��{�ُ�Z�B�E���n���2ߑbĸ�Ӟ .�ʍg
��`N���s4|
��ݘ��b�^�E��.N5ຊ���x��a��*���<O�({��}�>�������p)F�G���IOg���,��ʦP�u:-�'�W\�7;��*S�ǽ��S`���5d(c!cSM����.�hZ���U��� {����a���y4��d��cxi���(-Q�WBa�;F�p��WJ�$`Gy�J�%��|J�j;پ��f ����!��#�C��Z��|ATu��y��ç�������J��@�dgҊǉ��/���D���7���B_�f��B>P$�\�I;��ͩb*�Y=t~��9��=�e�    cR����.K��Q��'��������i
��a9
)I�ҏ���[�S|o���8%M��P�#�rX=���X�R�8�K?鞆���{l�*r��(��(���f�|����?�L"N3�&7uB&��SK��v�SHU� �{�8qW7G���+ꢉ�G��^���}��i����
�6$|ck��2?/�˵�3����2v��J���Ak2�ZL�O�$%�����z�@�wQ�k̲���w��V L6��O����&�x�\I^����x����ΖY�R�ҋ怦?������<�P/�Qs�j߄�����P�\hǤ�Ǚ��}�]��%ӃS5Z}!O�<�nB}o\�k����u��\N =S��uv�/�{�;fק�<����δ����n/�3Gը����(/�_����@��
���,5fX���)l&�-;�)y�]�Rqk#�	C�'�J�P"}ۖ���[�lj)�& ��F�*�fSz���v�SOr1�������	��r��佀Y�}�{�#�Z_W]=��8��橾T�dM��}��
��΅��vɉ�`�d:j)-��9ն�3�s@��J�&eu�b�v?�2jEv�|�+�����c��8���zb�&瓲��?O���m�݈������ڠ�d0�@1��F��c|�2�>��>��!�.�YU汱�KcX<�ǌ�6a
�IY3����]�}+�����1Q��k�]H����]�kc�v�jJi��RüɊ'�'>��uGv׸�l�z�ޡD�*6���2w'�J����S�b�����
ZV��3H]�|�Yu~ W�E���)�kD��H[��G�cy"UiC�@��
��Æ�YTi=�����
3v�ёL�t��0%K�`ig�1�Ͽg&k��f�Gi5䏞�"�D� ��E{F z�<���$0?��y�]�ajD������:�Y;"?���-�x�t�D�̾��Qhʄ��i��R�(w���
@LA}���J5����Ej��]g�����е�!d�����f���;����&+$����4Q/}�c�2�(>��ӗ���;ՆYu[�ڀ�$%�N����$�a>QA�E}�*5�J�3K>fw�:Mh�5�j�Y�N����~_\[6���n�4��Ykk�Z8��o�a>Ϋ�d��¡�l�����3�Z�lo��`b��M~_a�~{�V9��S�
��=J�t��r���m�0�\��^�Ѫc����8�]�-'h���Whv��+� 9*=_I�q/�����s 9��90u�I�5�D,9�GbQ���΢έ���ZjP	R���u9C��Gn�.uH�ʣ��%(�!�Y��,����J�qx�|V0�ʊ��\�M�{�ӗ�x��v��UrV4�A��,�?���������rXg�+ɵ�h�� ��f�w��y��]&u��ࡋ��!n�=\����Qf�ߌ��a�G�����;��/N`x�ĩ�ǁH�6��*��w;:���*��e�B��R��!>U���Lg_m���)��{��1_׳L����S�I�c�j����bK꺍��n�C��85L�U'-u�6�u��|�,9���B�V���R]�>P5��Iu&��
]�U��:��j��v���i��^�ଇ��y9ʆ&k[A�ħ�+�>P��a�μ?�lY��0j����v��}��m}�&�(�vY&��S�y`.�ҟ5�v��q
t��N�L�Ś��i�2/B%orۺ��YX%��t�X��۳�jx�_���y�0��LQ�W|$����W��%Z����]�m�n�c=-G}�)r���VM�������,��]Z�O�*����ӷ���{={`=���zE�@~b:+��_9������4�����E6�:�՞�2��t�_�s�[Z?��{Q<l в'�X �_�[�4@���9gY�v'����k�-z$��Rڞn�L���:��އ��~T؈��L?��
[R��;*<V ީ����}�{~R�ohR�PI��		���2d.�v	ƧRRf*f&n�eD^��y[��P%x'~[�}�0�7(��K�k�۫�;�a�(m�>QW�i;V��.rC�bUL4On<�Z/��Y�ꅮ7�!�.��?�*�=5�U�z�/J��@R?n�i��昲��U��u�:P{�~^N˕�M_�+8si���R\ܴ@���ϳш�0��o��p-��E���U�=T����X�ݸ���F��eK^�D��S��_k]Z��~�.�)�T[r/R���gY�0S����N�x7�����T����N����'�DѾ7j|�xg�?��K(��W	C=���^�A6J�����`l������W�����P����]Θ/�(a�{�W�Vr��GTM�`zV�)��F��bJ։tb��axd[T��f+�m-*�'���_K������|����Z	�j���64�L�
A�����;5K�y��9gBka�Wک�۩&���{����8rG	rEZ�B؎5��i`�K��7��2"R���]�L�O����/�B�S_ed�Cߝ��������D�MW�
�m�֩��nnS�%�-f ݼ�8,u\���W�\�Z�/�Ξ���a'�����,��zNqgвc���8�&�#Ւ�����,�K`�p>�$��d�_�g>��c�1�X����>���Ǩ=So"�N���>,��G28����d�� f��[�p���o�s��I��t��H�R�r�j)B��.O��ڜ���!lxz�|tI�� ��-��P��w��T**ͤ�� &�Qg���4��J�	[�=-ש�,K��R�8}ulY�Gߪ��PK���,9�.��p'�����Z.��č��@�\��k*������$n�Ӫ��`E���~#�@�:XwO&R� /�a[O�Y�mQ��-�EQ" _k_�*������=�ݽ8y�fE=N��2PA�s�ҩB��YJ{��[5��KV��!���z�'��zʁ:f�q� >���*�u@�-6�vT�&�c<��`�e���j�>�[����b$%hV�?/�;����wx���G�5HzG��_O���&��d�%���݇icc��#�.70�� �k���/�l=���\�O1X���Uʴ�p[�I�M�u�����!�h������J9�~��S�K��eT�����R�Y�Ol��K~�e��/������%6E{d�*[��S����E�𶳡߾�a���Y �F��>�ngC���P[mk��oq��Y �Y��ܙn'�j
�8զ娨�)�H%Y��d��\�è���A�8@U7�U��A���a�=$�$����H�X��6*v�|�g�m�!�u Bob��b���a��/�>_������տ���# %��o70s�7�7s`����8��s7�OН�oM*�N�G,��+R�+�m�%�u"ԛ���_B��b7cP����Q�����q���D�&�x�։s<��$�,�7�iv�H;9bJ:L�+�ދ��f��{>/����r�-�]5�x#�7�mj�*u.ʼ+q��u[�!���2R{7��9a��:�}"M��<Y����woz�M�\����D��a:���I��
X��������P��aa�計�9�����o�O�*C�V�E��욪��o�����W@`�������/���� ��_��j0����>��φ.�N��N��uZ�MR�6t'v'�B��	��;�(���^1]j���7Z��Z�$���L�>�
ލs"�p"�fY�o. ���P)��u��9�k���G����ӣ��K���ȧ�Cm�z���<X���G�4Ֆi]�}����_�4����EP������]�Tm�5� �P
����6��SJK>�ɄN�Q�nɅXU2�4;�_�~c�/2P۹����֓�q�{�$I!�)�b?�+?���C��F�e0>�������{Ĩ�*�e�/�躥j������ܟ2�+��J�e'��"��t�ݹ���ݧ��?����rݛ�Jw��AU�p!�`��݄z����(�� �~؎�Us�.�0�![o	�	��(4������ї����:5�$؂� U  �7F����ճ��o�+�R�ͱ�w3����!	PW_y�F׸_���v��u=��K�[FM?Vz�2��7�7��<I�h���k=��p����hqV7��$?e�7��-g��'J~G5k�i�I޽�<i�^�JR`;�G$��CK�ү�Ҩ�X�/WzBe;-�X���Wx��"��ϐS�/��j_�~�j�o�l�\���V�@ڙ�CKM�]ݡ�L>�������?N|e�.4�}mDIRtL���D�����)Sf�U���/�|]^j�C
�����������۾�?O���q{���Gl/#��ޡ���ׁ"6|��6ByAC�p9�$�{@'��>f�I��п�fԊ��u���Q�,z�,�0����i������r�Z[�����PʁP�Bf��7���o �5�F�`l=��(���)D>� =����o������o�tqpp��� ���L���Z��Fu=���	iH�Lc�zE�μ3� U���0��KGG��j�	��}q�@����@I���!�+iL���nM�e����7z^(�~����.�gr���z�d}��ҭ���4u��P�NӲ8/ΤѥG�ci?X�p"ǯ��z��P���Z?1��:{ m���&������:U*BT�/9Нͅ���]U�F��7]���Vk"X��zz�>�Ԙt'���SX�T�-S��F�������-�ցDt�%'V�B�KK��B����r�WR�c7�a���&���g$�5[gU�l�|����Q�Ћur������6���/�w�C�'��U'y)���i�`!QsC��Fe� � ������0����.�=T����~������1      6   �
  x��Y�n��|�|��@��g�ֻ9�96�x���e�-�2(	��~��B��Hy��33]]U��U��uh�0�9�����P�;���lM��6E�؆z3��۲oa����av��ϴd���|�U%ؗ��g���q�|��JIm�c+|�����ٮ�kX�S>�S>�I�m���O4�a�V�s]q��>�}~��&4��)�)�����
햮�yOH��PҰE�1�6珰ڄ�eu&e5��jv����]�.C˜S�s�5W���|�"o�sBE	M.J�P���Y].�H»���!��eq�Ӳ����#�Y��Q.k��x�-"�#os���V�|��|�}��6�'�W�椰��쁾���}
4�Ȗ�yv�z�O}�{��}�u�9�����K�>y[�_PSIx����a+�h��e�X���L����8*���w��7X�@�4���j(8�w��k��GSQ^��Ǉz]^�	m�v^rv����8���le��#����c�[���
�m%D�^(2oRd�2?��U�u��j@k��R��5}��zل�N7�R6G0�}mؗl��n؆���6���0���v�Y�f�"P�sJ���h�Y@l��Ŧ�cq��P�	BO�JR����t��(4�*�������]�����iQ8g�1��R��E���qc�|�5*{X�\;�;��Z�B�o[*Oo�������,��X��ڲ���9G&��朂]�N��oQoJ���\��E!&]�Όg쎀���hMJc�����u�>�N��Q�	�>�t��a�l��\�$JkقB�6�&Nh2B���М�K=�\7`�G4��H'%[ 0L��7,�¢�>����`�W�K�WF9��5rh┅�T<e6*���F�R��� =.SzE�)l�d��)º&2*�s��p2"��P����q��~��J����_���hLQ�1��w[@���r�D�nHg�q�2\�j�Ǌh�~����RRsi�*�qC�'���M�l�}�H7 #PSY'�E�K��oRPk���Yp!c��$���:��B�'��D@Rf7�%�O�&*8�G:Gǌ~`�"� *.cN�m�v�+qNzP0"�:E&�S\����:A���T���Kx���d�7i���x�[*H��
֣���=���Yi�r�8����κ�L�'0͋.�΢en�xY���I�y��:N�Gu�B�=�*���P\F^n �F�L��2�~;�D� �G�,�4���v=	����y��@<+=f'��,9���I1͂ �Mj�A�k��J��j�}����5J挹��@P����TeՃ ���ph�צ�M���d-'.��2s)R��'��?�$:�֐ɞ�?��T��|��F��>�>�kɥ;<" �={�!"m�A~�/���p�0�CVmX�_14Fb���㐤\V�|L�`0����=e7 ��bq|G��zK䅑��J����>'V��f�np��+̸(3���z:]�7k��7�R* <)��q��C�m��ZU|d 5��L]�u��I��d���H8��O����c.�E�<w|$ב�"��ϣ�"�&PmsMd̩3-vm�h�a�'.��H����/V�D;�O�A�Ä����y��|�O�	����eFQ<�G��X��c�Б�W����{�]��}@K6^�v1C(�&��RM̮�����V�$��<a�9��jr�a���P�R�K]\j���0$��N۰l`���
A�ZJlz���V�WpOQ��͝�xK��Nbu�޽nQ�'��ֿ	���/PKVI��F@�m��	\�,�.�M�/�f���܍04��btb���,{�gt�u����;�ۻx�- �g�.c�Mf	��!ж�H�r���)2� -zZ���:�@N�C�ϓB���z�Z�l�qi�ujhki�]TZl�g�,���1��ԛ��Q�L��+Ͷ�-O*P�O����B	�i!�v�@tY���<\r�?����������}Ҍ�C�w��u�i�G at�;�?�X��q*5�[h!Qy�<��rd��U���luNS��.1FW��tƆܳ�s\� GdE2���v�ČF�u���ɤ�;��\k���c��ݸoݭ��3��Q���C�|��}�L�q�1�K��bq6F�O�3�x�>bl�\��+�<�X8�=�9�,ώfgD�R�]U�nF�$W�D��Fa��J)�t�^w^	��4+��/_W��C<�H�߉��OҠ,x�H�cj���`��t��O��Ҙd�t������E<�f���p_%�� ��+�h��zQ���:��݌&HA��$�W���2��@ܠ��c�����%�l�9�j�����=n{��0I^j<��=�(	�O`���(u�9�1��>���\���.NO瓍� i�8g���;�Je�������_�{<��M���������,�X�!O{�~Ip����iod��_��!%�"q�@��P$:�B�w�J7�Is��a{����
\���t$�O��_A�s�����bj�L�VˊgD]�EZx��NS���P�Q�c�c�o�q.����o�E���FG���"��/�t�/�ш���y����j�Ã:^�x�:��:�.�*� N6Bh�b9��i1�#��3_�"�@�]��~�	7�
ID��1vYʠ�A�H�
�>�@;8%�z����Nߧ�9����?|���gO�     