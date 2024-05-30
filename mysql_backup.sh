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
�2Xfmysql_backup.sh �WmSW����t�12�,��3:�m�-ӱV���ݐ-�v7��3�*J}�X�����0`���d7�'�BϽ��$����s�=��9�&�Tu!)�i&�ŭ��v��g������w��rk�Ԅ{{�]->������Xq��D�a+$S��AÒ��?D:�tu>c">/m�N����!G6����􎎶�!IJ��� 5뤎h�Nd��p�����[�&�o橻=㾼���r����&)J�Y3!�V\�EG�����8W��"3c���𻆕H�%�#��[�!���ɺ��W�Q�&���B��apH�5̶�x�������}?������jyd�8��|}k@�Gj�(��8w��RL��S;�<{��Q�/��&��|o��
~�k%��H��i˕s��\���X�F�A�%�_�"C�Z8A�5 ��l��t����w���8�<2�������(��Qw���?�sc��7+l?.mO�W�28D�io�lk?t���@�dhc�������
tT�w˭@s�LT��ML���r���X�����/��_uG{b癓'���;Ĺ*fzVK"�Q��ʊd�
�`�(IC�d�-
�C��k*N�+�C�i��\Ǖ�wo>�^r'o7��4�%լ��˄q��x��J���(R� w���%X8v��e��a���EMU� ��\���7��^�N�@�Die��ST`OVê�&4�Q=aKiE���aS�(G����(�3l_��&F6��8�5�C��Pf�����MtS7�f�.�<ƓQlS�;�U�t�p�}��W�V2i�A5g�Oa����G�I+:�����F%�)��|��!T�����/����/�i<����J��o>
CqI� ��j�	���J�wgS�)�3	U0LG ,���Z�6�ܣ�wr�
L(bi�-Tp����^~S��@J�e��,��F�BsG6ǐh����J1�D����8N���^��7����Ư�6I�Ȓ����趑��D�Y�Nf�Ù#�v؝�-��̝v:w�}v��=���r��hU;NX7��{��p&��*J6��ݙ(l��:���I=~	]3���[��Y�>:&�%���//�]p�2b��B/�io�i5�*�[im�ݺVx���>Ѽ�`�� ��;e�<�ט�H����}&�z���~c�KKkޓ,���A�n��v�"{o��@�-���*��߭!ՁvaN�6EEw;L��"�{��e��VQ�x�즳�4�B��wɝz�'�o�s\��V�}���]���6kT�CVe-�*u^�Vvb�O�'�w�zy6�vc�8w�}9����`�����V8���CqHj7��M/���ҵY/��� �&��M��'H�C�GJ��3��d)��Ii�3,���Z�f֗�Қ�����Vuh��(��tZI֟��]聒�`�ɩq�jdj�T,D?�ď��0���  