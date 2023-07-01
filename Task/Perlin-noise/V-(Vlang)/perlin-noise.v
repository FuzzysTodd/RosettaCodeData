import math

// vlang doesn't have globals
const (
    p = [151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225,
        140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148,
        247, 120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32,
        57, 177, 33, 88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175,
        74, 165, 71, 134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122,
        60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54,
        65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169,
        200, 196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64,
        52, 217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212,
        207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213,
        119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9,
        129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104,
        218, 246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241,
        81, 51, 145, 235, 249, 14, 239, 107, 49, 192, 214, 31, 181, 199, 106, 157,
        184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236, 205, 93,
        222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180,
        151, 160, 137, 91, 90, 15, 131, 13, 201, 95, 96, 53, 194, 233, 7, 225,
        140, 36, 103, 30, 69, 142, 8, 99, 37, 240, 21, 10, 23, 190, 6, 148,
        247, 120, 234, 75, 0, 26, 197, 62, 94, 252, 219, 203, 117, 35, 11, 32,
        57, 177, 33, 88, 237, 149, 56, 87, 174, 20, 125, 136, 171, 168, 68, 175,
        74, 165, 71, 134, 139, 48, 27, 166, 77, 146, 158, 231, 83, 111, 229, 122,
        60, 211, 133, 230, 220, 105, 92, 41, 55, 46, 245, 40, 244, 102, 143, 54,
        65, 25, 63, 161, 1, 216, 80, 73, 209, 76, 132, 187, 208, 89, 18, 169,
        200, 196, 135, 130, 116, 188, 159, 86, 164, 100, 109, 198, 173, 186, 3, 64,
        52, 217, 226, 250, 124, 123, 5, 202, 38, 147, 118, 126, 255, 82, 85, 212,
        207, 206, 59, 227, 47, 16, 58, 17, 182, 189, 28, 42, 223, 183, 170, 213,
        119, 248, 152, 2, 44, 154, 163, 70, 221, 153, 101, 155, 167, 43, 172, 9,
        129, 22, 39, 253, 19, 98, 108, 110, 79, 113, 224, 232, 178, 185, 112, 104,
        218, 246, 97, 228, 251, 34, 242, 193, 238, 210, 144, 12, 191, 179, 162, 241,
        81, 51, 145, 235, 249, 14, 239, 107, 49, 192, 214, 31, 181, 199, 106, 157,
        184, 84, 204, 176, 115, 121, 50, 45, 127, 4, 150, 254, 138, 236, 205, 93,
        222, 114, 67, 29, 24, 72, 243, 141, 128, 195, 78, 66, 215, 61, 156, 180 ]
)

fn main() {
    println(noise(3.14, 42, 7))
}

fn noise(x1 f64, y1 f64, z1 f64) f64 {
    bx := int(math.floor(x1)) & 255
    by := int(math.floor(y1)) & 255
    bz := int(math.floor(z1)) & 255
    x := x1 - math.floor(x1)
    y := y1 - math.floor(y1)
    z := z1 - math.floor(z1)
    u := fade(x)
    v := fade(y)
    w := fade(z)
    ba := p[bx] + by
    baa := p[ba] + bz
    bab := p[ba+1] + bz
    bb := p[bx+1] + by
    bba := p[bb] + bz
    bbb := p[bb+1] + bz
    return lerp(w, lerp(v, lerp(u, grad(p[baa], x, y, z),
        grad(p[bba], x-1, y, z)),
        lerp(u, grad(p[bab], x, y-1, z),
            grad(p[bbb], x-1, y-1, z))),
        lerp(v, lerp(u, grad(p[baa+1], x, y, z-1),
            grad(p[bba+1], x-1, y, z-1)),
            lerp(u, grad(p[bab+1], x, y-1, z-1),
                grad(p[bbb+1], x-1, y-1, z-1))))
}
fn fade(t f64) f64       { return t * t * t * (t*(t*6-15) + 10) }
fn lerp(t f64, a f64, b f64) f64 { return a + t*(b-a) }
fn grad(hash int, x f64, y f64, z f64) f64 {
    // Vlang doesn't have a ternary.  Ternaries can be translated directly
    // with if statements, but chains of if statements are often better
    // expressed with match statements.
    match hash & 15 {
        0 {
            return x + y
        }
        1 {
            return y - x
        }
        2 {
            return x - y
        }
        3 {
            return -x - y
        }
        4 {
            return x + z
        }
        5 {
            return z - x
        }
        6{
            return x - z
        }
        7{
            return -x - z
        }
        8 {
            return y + z
        }
        9 {
            return z - y
        }
        10 {
            return y - z
        }
        12 {
            return x + y
        }
        13 {
            return z - y
        }
        14 {
            return y - x
        }
        else {
            // case 11, 16:
            return -y - z
        }
    }
}