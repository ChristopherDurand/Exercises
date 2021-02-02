def decrypt_rot13(msg)
  a = msg.each_char.map do |char|
    case char.ord
    when 65..77   then (char.ord + 13).chr
    when 78..90   then (char.ord - 13).chr
    when 97..109  then (char.ord + 13).chr
    when 110..122 then (char.ord - 13).chr
    else char
    end
  end.join("")
end

puts decrypt_rot13("Nqn Ybirynpr")
puts decrypt_rot13("Tenpr Ubccre")
puts decrypt_rot13("Nqryr Tbyqfgvar")
puts decrypt_rot13("Nyna Ghevat")
puts decrypt_rot13("Puneyrf Onoontr")
puts decrypt_rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
puts decrypt_rot13("Wbua Ngnanfbss")
puts decrypt_rot13("Ybvf Unvog")
puts decrypt_rot13("Pynhqr Funaaba")
puts decrypt_rot13("Fgrir Wbof")
puts decrypt_rot13("Ovyy Tngrf")
puts decrypt_rot13("Gvz Orearef-Yrr")
puts decrypt_rot13("Fgrir Jbmavnx")
puts decrypt_rot13("Xbaenq Mhfr")
puts decrypt_rot13("Fve Nagbal Ubner")
puts decrypt_rot13("Zneiva Zvafxl")
puts decrypt_rot13("Lhxvuveb Zngfhzbgb")
puts decrypt_rot13("Unllvz Fybavzfxv")
puts decrypt_rot13("Tregehqr Oynapu")