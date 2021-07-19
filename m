Return-Path: <ksummit+bounces-389-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 386723CD4B1
	for <lists@lfdr.de>; Mon, 19 Jul 2021 14:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id A3F253E10E0
	for <lists@lfdr.de>; Mon, 19 Jul 2021 12:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AE12FB3;
	Mon, 19 Jul 2021 12:24:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5AF168
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 12:24:55 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g16so21804433wrw.5
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CO0BGs7i04miJJIV41Jc23ouoOzoJEMJ4gF1ns0qQMo=;
        b=ga1QEA7fiMk+4AC31qDYcvEKlTIjjau26PEsKSzBBk+8st+BpIOjL1xEWO5R/q8Lgv
         stABmynq3kaLwal9DL2yNBxkYdDCvMBf7Ri1OA6DRMdNkHbgjRXSPXkj1zBiV95/JCBM
         ZzoLTQ27PkqK6/ytlwoeWpGmUkS60pHf/FIEa286SL0r9fJfRcjD2UPqCyoWCrvgIWd5
         L8pjqxV1Eez8JPtMfznJklXtwrk0RHipRU/L1iJkiXK+J5j8WCLD6YB8RBCdo0iI3/PW
         jxjlystHsEbj747yq6GZsFQlFtncApcfwFy9/XVUEF0xNu29Uy2WfP7Lt92VEbwt/M4k
         5+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CO0BGs7i04miJJIV41Jc23ouoOzoJEMJ4gF1ns0qQMo=;
        b=MUCVgNlDt4t0UZQOCt82d8VlmAow8s5v/gx+mC9Ui8OA3hvWGGzz1xeCDmYxgFwOvC
         pK3DrEZEm6o9EYoIRtm5+66UtDNvhGqm4Bs0hvhyIQgl1/TC69s0LbToQWqo2BIjEO6E
         Sjs4H94RtpVfVI4F8MVv7eJBUs162VGze1o84NXLJCH9qA0dZO9Xlo/JvIZ9V622R2lb
         l+ZrPq5yTAM9hGB89rH7+Pjf6ttcHM0jPqZOg0y09u8bg/rQlk6aB+9tOT7zverfL6h5
         LQKRtQr19ud193TEDV6SbRu7XQaUnl50jt+9fTVWzDW++sHDjqDStbPP7SzgtQT1UhcH
         SDiA==
X-Gm-Message-State: AOAM532mcy4RtrHYAlUkh/Ck16eKdmZwWX2DXCvNvqXNUcdlCwhkQMO7
	yU9Q/eVxnCPjqQ3ApHnEZ6nL
X-Google-Smtp-Source: ABdhPJy7PMc0PfmTZZ6NCk2wjsI8c5Yb8fbBXQ+8KhKg3KMZg5UVswGuIfq17usTT6XLmjE5Nmu+EQ==
X-Received: by 2002:adf:82f1:: with SMTP id 104mr29491338wrc.306.1626697494190;
        Mon, 19 Jul 2021 05:24:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:7317:9289:34f3:7374])
        by smtp.gmail.com with ESMTPSA id y197sm19485774wmc.7.2021.07.19.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 05:24:53 -0700 (PDT)
Date: Mon, 19 Jul 2021 13:24:49 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPVvEZgcP1LMGjcy@google.com>
References: <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>

On Fri, Jul 09, 2021 at 12:13:25AM +0200, Linus Walleij wrote:
> I have seen that QEMU has a piece of code for the Arm PrimeCell
> PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
> Note that this hardware apart from being used in all Arm reference
> designs is used on ARMv4T systems that are not supported by
> LLVM but only GCC, which might complicate things.

Here is a working PL061 driver in Rust (converted form the C one):
https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs

(I tested it on QEMU through the sysfs interface and also gpio-keys as QEMU
uses one of the PL061 pins as the power button.)

I have a long list of ways in which Rust affords us extra guarantees but in the
interest of brevity I will try to describe how Rust helps us address the two (or
more) lifetime issues Greg mentioned the other day.

Rust allows us to build abstractions that guarantee safety. Here are the ones I
used/built for this:

1. State created on `probe` is ref-counted.
2. Hardware resources (device mem and irq in this case) are "revocable".
3. On `remove`, we automatically revoke access to hardware resources, then free
them.

What this gives us:
1. With ref-counted objects Rust allows us to avoid dangling pointers. No more
UAF because memory was freed when the device was removed. (C can also do this,
of course, but the compiler doesn't help us if/when we forget to
increment/decrement the ref count.)
2. Given that references to device state may outlive the device, revocable hw
resources allows us to prevent the use of these resources after the device is
gone. Rust ensures that such access is only allowed before resources are
revoked. (In C we can also do something similar, but the compiler won't enforce
this invariant for us, i.e., we can make mistakes where we forget to check if
something was revoked, or forget to hold locks keeping resources alive, etc.)
3. After revoking access, we need to ensure that existing concurrent users
finish before we can free resources. In this implementation, we use RCU so that
resource users need to hold an RCU read lock and we ensure that they've also
completed their use before freeing the resources (synchronize_rcu between
revoking & freeing). Locking/unlocking happens automatically.

This, naturally, doesn't solve any problems with the existing C code. However, I
think it addresses things on the Rust side. For example, suppose that in
addition to registering with gpio, we also wanted to expose the device as a
miscdev (I use this as an example because we have miscdevs in Rust). The
refcounted device state can be stored in the miscdev registration, and each
opened file can also have a reference to it (device state). We don't control
when the latter gets released, but it's ok for them to hold on to state because
they won't be able to use hw resources after the device is removed; once all
file descriptors are closed, the refcount goes to zero and the memory is freed.

Any thoughts on this?

(A quick disclaimer: I'm sure there are scenarios that don't fit exactly with
this, but the intent ATM is not to cover all scenarios, it's just to show a
working example of what Rust enables. Eventually we want to generalise these
ideas in cooperation with maintainers, who know about all scenarios and subtle
issues.)

Cheers,
-Wedson

