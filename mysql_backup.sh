#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��~fmysql_backup.sh �W�S�f���b��yP��9�3�釶Ӗ�X+̙�且ˋINP`�Z�C�R_@�V�jp�+o��%w����<����(ر_2��>����'�����	q�J1!(,m緖����t~�Z����u/�O7��L�;�ǜ����*�X�e-U4m�D2D���M)9�C��X{�ѓ&��R�eGٴ���-��Dzkk�Q��H��%#5c'���6d��p#����[qǗ�wz�ٙv^�w�n;s+��a&.&z3FLR̨ ��(Pe>)Q�"CE�̴�S��� +�TҲ�G�7��6���Ug	�D�|UT�1|�
)]���~QR1�����?�������W�rk����b��8ր��(���+xd*
�,�0�\]�)��g �?��Q�4�6��|w�� ?���� �>i�G��ʶY�D5Z"���d	"���	B� Hufro^�3��מ�6�9��i��u7;�dG��Yq�~�m�$���L(��[n�qag2��Z#/�L%���߃)Atz�8�
e�؊�ةC���>V�R="���#>ǇU>,A����W������s��6�L�1-�ƱḺ��(P�W@��K�%������Q��T�k]0LE��k"A&26��|�=pn>�nv&n�7�����bT:��;�e��F�ݹ�R���ȉ�,��<��I�p�p�Z�a��	R\U�:ڙ�g��$�ઇ�2�VJ�Ҫ8�d�8)���3�`O����&T�Vt-f%R�*Re��lR����[��A���3�� |��Q�Q�R���0� �U;n���!eT��pyM�1��lbB�ʺ����5n��Ÿ ƚȬ#�$��#�w����`�d����������ss�f���fZ�ۓǅ������vf��o
}�T*9(�7��	���D��g�1i�ji"&�-}4ٺ���}T|��L�WpA��E�KY��=�;7ܹy�]MIE� ���+�*Q���-���cOx3�xg��\nޥ1R�k�����;v��E�H���]�8���qi+��-7(+)V�߮�%�[�Ҝ��'S�P�����W���Ђ�]ɽ��Ǳ�d���,�¸�]C	�F'�;㹭9�C��p��R�hBW��f�M��Y�>�{F�h��]^%^V��|iPDj�n\S��b%�*M\a}�پ�{��]>��{`��2huw�
^}�/2�������L�u�^x~z}��/,��O���{݃�n���v^MW�� ���Y��[�~u�u�H�0����-���w
%�����'a8gjצԋ�,Ԟ;�)�Gў#�Ki�^p��eg��G��p�^���8:�e����Z�x?���hP��𺰺r��K�{�zqf���Lm�xZ*�.�������$�]u�V��p�ڌ;���2p�'��A'e;�����N�I��?LH�?'	tS���T���FƓM�T��A{{{P�o����|V��6��Ka|��{;`٘��3�hf����K�1��z~r���YxN�L�K��[��=�޲؏�(�y��!C28`y�_N��:0]��:A�3  