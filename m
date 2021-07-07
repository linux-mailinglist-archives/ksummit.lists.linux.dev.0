Return-Path: <ksummit+bounces-322-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E86CD3BF238
	for <lists@lfdr.de>; Thu,  8 Jul 2021 00:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 975813E0FA1
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7A82FAE;
	Wed,  7 Jul 2021 22:44:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BC370
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 22:44:55 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id k11so5746565ioa.5
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 15:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kCtrbBa69drlyv6TSCClf1YMJ1KNeD2XJHE1lIbUEic=;
        b=tHvCNl97CzjBm01BsoTP58kEaNC6gAPdYsMXw3MXfD6J3CwWGJCHPu+s/UothwyZdI
         QBI9HoV0oVFWPvbfkoneAeXOHwnTCfuZLBnx6sCYm4GP5oDdg1heZVIT3A7ST89i0kZP
         N7N2hcjn6JaZAAZo8DQuHRIx64JpM0cXVm6MOvLUp9q99/7YH6QyCTFBBROUhOzLMJl/
         wiJXsZ6sjm9XUtPx7O4mPbr3umevS/c9jNb+GDnw089kkKu3EvqnXUmddcq2QR9LcYvD
         /PQHwGSgln9jaYPiD5Xz6RvGREi96tmgGQIpkyaKkVAFSZeg/rlpARlbBNuddfo2kbgq
         1A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kCtrbBa69drlyv6TSCClf1YMJ1KNeD2XJHE1lIbUEic=;
        b=tSTGjAxLS7UW4+WN2VqdK8bHHNXGa/iMVHh883ZyrQHbDMzejOyVJFn1z2OxDx4Hbk
         8VqcjWhx0RplLvBS+OZ1+tBNG6YmK8PD8Ovr8YelhIoX0T8yETNv17Mgsm4eBcAppvxP
         dt9EfU42HCc9fm9o32XALKyOc7Oc5R3cdyv2Rqun+7p85ai6B1JpkmNaOMyAR4dz1Ayg
         hOjFV/rn9cuqYCgedbLR4e6Ii67hM0MK+fToYqzqKg+j6z5yXlErffaCV8TDnmp4ZH/K
         Sw5p8NKNZ7WAVgjQvQu08BSxMKn8dGAQoY1GTmmq8vEuugZd8VG5/MBnP7GBRlrtOBiN
         hp2Q==
X-Gm-Message-State: AOAM5313lk9ZKk7lM3/mh1etjKp6jM08QszdZmfqbCq/pgRbVkiJ0iq7
	89mAdiJ2NAEH9gE2M96SuN61MdcG+yy7EqGWuRs=
X-Google-Smtp-Source: ABdhPJxO6AKVmiXnv4ORaB7WLEIySLl7Qby8PtoqBZ7yJJmag0asGxMESOAL3YwQBglxuN4vDkyMDgikuYo98WpCfeA=
X-Received: by 2002:a6b:185:: with SMTP id 127mr14349707iob.64.1625697895117;
 Wed, 07 Jul 2021 15:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
 <YOVbsS9evoCx0isz@kroah.com> <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <CANiq72mWvniSwhEKLqkfRboFr4=r8k3pSAXg5-SyW45e4Ch27g@mail.gmail.com>
 <YOYg1ZQXx9ceYfBX@pendragon.ideasonboard.com>
In-Reply-To: <YOYg1ZQXx9ceYfBX@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 00:44:43 +0200
Message-ID: <CANiq72mqF1hKj6wN59A1yn9NQ_zXPAXdkFDSstw9BY_P4sTapA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg KH <greg@kroah.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, Linus Walleij <linus.walleij@linaro.org>, 
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 11:47 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Out of curiosity: we have in the kernel objects shared between multiple
> threads that require locking, but in some contexts taking the lock isn't
> required. I'm thinking in particular about initialization time when you
> create the object, before it is made visible to other users, or
> destruction time, when you nobody else can have a reference to the
> object anymore. Avoiding lock operations in those cases can be an
> optimization. Cn rust handle that ?

Yes, you could provide e.g. an `unsafe fn` for users to access the
underlying data if the users know that such a thing is sound (by other
means that the compiler cannot verify).

To use it, users will, of course, need an `unsafe` block to make the
call compile; and a `SAFETY` comment on top of it explaining why it is
actually sound to make such a call (we require these).

Cheers,
Miguel

