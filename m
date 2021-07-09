Return-Path: <ksummit+bounces-372-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86893C27CD
	for <lists@lfdr.de>; Fri,  9 Jul 2021 18:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 511D83E10AC
	for <lists@lfdr.de>; Fri,  9 Jul 2021 16:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3F82FAE;
	Fri,  9 Jul 2021 16:54:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1368177
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 16:54:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id k16-20020a05600c1c90b02901f4ed0fcfe7so6698188wms.5
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tGx/Hhtktq5XL21G9CR+S7THOHzE1gtry7WRR08sgJc=;
        b=cupw7tryTd77+XT+VaH1nBrMlM+Rn0FAThJffHxhuOX82g6T4MKr0cZ1YEaQzquOJo
         tu9zFcF3Z/s1n/EKJCL0Y3D8nsaoIF4GlbqueUcIUh/0fNo8l3GNJ4ZvTBP70WL7FIkU
         ElI17lrunxvGCYwNyfuRWN7sYRNChrOSuU0so6gvBMSF26ujWgMfM1xLPhtoMoIy7hFS
         Z3mAfRlaODgwf45Gs3s+24cWK9yD9gahAYJnBOHXBpzFQk/JL6wuCQ4MffgQT4OAOLXz
         fFt04ejJnPiuB5fRo7DpKLtPqKm8Oq+/lNETgMntNyLNkklGcZOKW/l49cL4tQFKCdKg
         V5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tGx/Hhtktq5XL21G9CR+S7THOHzE1gtry7WRR08sgJc=;
        b=irB6c4AEeamGJwqwsUMF+DK1acO8oEq2WO+LwLtmsybj+7/9fMgRuMRsIWfEns6wzQ
         hz/liipledKvm+TZrblcnXKa/JE9M6Ml91PQ9wzV1euwAPyT9iwSEIW3oNPxkfRX37Pk
         Lk3XUxX0EhO1HrDJb6LDpA1HBrONyMpbCyy5kU5xWyISz/whApi15expVLzT/HKrtwxe
         Y8KE2LE67CMwRRLa/g2zSNir058NDB/NmRi+UycXYs8SWE+0aqeKyPFJaT1fdQV0u9r4
         jpw/I34Bwcq53SrxQZogpoQALP5fblD99G0fqraQiKYRl232kYOV6iakqiPbHkf6ceBJ
         dfKw==
X-Gm-Message-State: AOAM533RcMaq0vSnrC7K5hGmRsMmM3zf3NmR6NrJd0AZaiywdxJktUZt
	2mxQ6hhe6k51t0/sU8zhaAF1
X-Google-Smtp-Source: ABdhPJyN6b073f0q0LgsmJVvz2pDE4XdUYJjS1IVJEOdz5cXGAkwwL4/qDxt/jU51wQJgOC1Yg3VpA==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr40475720wmj.44.1625849640931;
        Fri, 09 Jul 2021 09:54:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:8574:f6d5:2ca2:8ba3])
        by smtp.gmail.com with ESMTPSA id p2sm1639906wmg.6.2021.07.09.09.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 09:54:00 -0700 (PDT)
Date: Fri, 9 Jul 2021 17:53:56 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg KH <greg@kroah.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mark Brown <broonie@kernel.org>, Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
Message-ID: <YOh/JC//dotfm5J9@google.com>
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com>
 <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com>
 <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com>
 <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>

On Fri, Jul 09, 2021 at 01:06:22AM +0200, Linus Walleij wrote:
> The crucial part is what happens when a device with GPIOs
> disappears, if e.g. the USB device is unplugged or the driver
> is rmmod:ed by force from the command line. We then unregister
> the struct gpio_chip and drop all devm_*  resources taken by the
> driver (referencing the struct dev in the USB device or so) so these
> go away, but the struct gpio_device stays around
> until the last reference from userspace is dropped.
> 
> In order to not crash calls from the character device the device is
> "numbed", so any calls will just return "OK" but nothing happens.
> We then hope userspace will be so nice to terminate once it realizes
> that it is no longer needed, closing the chardev and releasing the
> resources held.

In preparation for writing the abstractions to implement a gpio driver in Rust,
I was reading through some of the code you describe above.

Unless I'm missing something (very much possible!), this "numbing" seems to not
be synchronised, that is, there are still race windows when userspace may cause
UAFs in the kernel.

For example, gpiochip_remove sets gdev->chip to NULL; gpio_ioctl returns -ENODEV
if gdev->chip is NULL, which I believe is an instance of what you describe
above. However, what ensures that it remains non-null? I see that in functions
called by gpio_ioctl (e.g., lineinfo_get), gdev->chip is used as if it were
guaranteed to be valid.

Is my reading correct or is there some synchronisation that I'm missing?

Thanks,
-Wedson

