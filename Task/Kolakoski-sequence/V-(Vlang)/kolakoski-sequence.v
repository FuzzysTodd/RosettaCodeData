fn next_in_cycle(c []int, index int) int {
    return c[index % c.len]
}

fn kolakoski(c []int, slen int) []int {
    mut s := []int{len: slen}
    mut i, mut k := 0, 0
    for {
        s[i] = next_in_cycle(c, k)
        if s[k] > 1 {
            for j := 1; j < s[k]; j++ {
                i++
                if i == slen {
                    return s
                }
                s[i] = s[i - 1]
            }
        }
        i++
        if i == slen {
            return s
        }
        k++
    }
    return s
}

fn possible_kolakoski(s []int) bool {
    slen := s.len
    mut rle := []int{len: 0, cap:slen}
    mut prev := s[0]
    mut count := 1
    for i in 1..slen {
        if s[i] == prev {
            count++
        } else {
            rle << count
            count = 1
            prev = s[i]
        }
    }
    // no point adding final 'count' to rle as we're not going to compare it anyway
    for i in 0..rle.len {
        if rle[i] != s[i] {
            return false
        }
    }
    return true
}

fn print_ints(ia []int, suffix string) {
    print("[")
    alen := ia.len
    for i in 0.. alen {
        print(ia[i])
        if i < alen - 1 {
            print(", ")
        }
    }
    println("]$suffix")
}

fn main() {
    mut ias := [][]int{len: 4}
    ias[0] = [1, 2]
    ias[1] = [2, 1]
    ias[2] = [1, 3, 1, 2]
    ias[3] = [1, 3, 2, 1]
    slens := [20, 20, 30, 30]
    for i, ia in ias {
        slen := slens[i]
        kol := kolakoski(ia, slen)
        print("First $slen members of the sequence generated by ")
        print_ints(ia, ":")
        print_ints(kol, "")
        p := possible_kolakoski(kol)
        mut poss := "Yes"
        if !p {
            poss = "No"
        }
        println("Possible Kolakoski sequence? $poss \n")
    }
}