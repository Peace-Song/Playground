public class SingletonImplementations {}

class Singleton {
    private static Singleton instance;

    private Singleton() {}

    public static Singleton getInstance() {
        if (Singleton.instance == null) {
            Singleton.instance = new Singleton();
        }

        return Singleton.instance;
    }
}

class SingletonThreadSafe {
    private static SingletonThreadSafe instance;

    private SingletonThreadSafe() {}

    // Thread-safe, but less performance
    public static synchronized SingletonThreadSafe getInstance() {
        if (SingletonThreadSafe.instance == null) {
            SingletonThreadSafe.instance = new SingletonThreadSafe();
        }

        return SingletonThreadSafe.instance;
    }
}

class SingletonThreadSafeStaticInitialized {
    private static SingletonThreadSafeStaticInitialized instance;

    private SingletonThreadSafeStaticInitialized() {}

    // Thread-safe, but always exist on memory
    public static SingletonThreadSafeStaticInitialized getInstance() {
        return SingletonThreadSafeStaticInitialized.instance;
    }
}

class SingletonThreadSafeDoubleCheckingLocking {
    private volatile static SingletonThreadSafeDoubleCheckingLocking instance;

    private SingletonThreadSafeDoubleCheckingLocking() {}

    // Thread-safe, on-demand, better performance
    public static SingletonThreadSafeDoubleCheckingLocking getInstance() {
        if (SingletonThreadSafeDoubleCheckingLocking.instance == null) {
            synchronized (SingletonThreadSafeDoubleCheckingLocking.class) {
                if (SingletonThreadSafeDoubleCheckingLocking.instance == null) {
                    SingletonThreadSafeDoubleCheckingLocking.instance = new SingletonThreadSafeDoubleCheckingLocking();
                }
            }
        }

        return SingletonThreadSafeDoubleCheckingLocking.instance;
    }
}