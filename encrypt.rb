def shift_13(number)
  if number >= 65 && number < 78
    number - 13 + 26
  elsif number >= 78 && number < 90
    number - 13
  elsif number >= 97 && number < 110
    number - 13 + 26
  elsif number >= 110 && number < 123
    number - 13
  else
    number
  end
end

def rot13(string)
  decrypted_string = string.chars.map do |letter|
    shift_13(letter.ord).chr
  end
  decrypted_string.join
end

p rot13("Nqn Ybirynpr")

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unyog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Wbua Ngnanfbss',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze
