document.addEventListener('DOMContentLoaded', () => {
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');
    
    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', () => {
            const isExpanded = mobileMenuButton.getAttribute('aria-expanded') === 'true';
            mobileMenuButton.setAttribute('aria-expanded', !isExpanded);
            
            if (!isExpanded) {
                // Opening
                mobileMenu.classList.remove('hidden');
                // Force a reflow to ensure the transition triggers
                void mobileMenu.offsetWidth;
                
                // Add active state classes for animation
                mobileMenu.classList.add('opacity-100', 'translate-y-0');
                mobileMenu.classList.remove('opacity-0', '-translate-y-4'); // Increased slide distance for effect
            } else {
                // Closing
                mobileMenu.classList.remove('opacity-100', 'translate-y-0');
                mobileMenu.classList.add('opacity-0', '-translate-y-4');
                
                // Wait for transition to finish (300ms) before hiding element
                setTimeout(() => {
                    mobileMenu.classList.add('hidden');
                }, 300);
            }
        });
    }
});
