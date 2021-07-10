Return-Path: <ksummit+bounces-378-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C328A3C35BD
	for <lists@lfdr.de>; Sat, 10 Jul 2021 19:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D88631C0F25
	for <lists@lfdr.de>; Sat, 10 Jul 2021 17:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292632F80;
	Sat, 10 Jul 2021 17:18:32 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413C872
	for <ksummit@lists.linux.dev>; Sat, 10 Jul 2021 17:18:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 803F761361
	for <ksummit@lists.linux.dev>; Sat, 10 Jul 2021 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625937510;
	bh=j6DYsrD8hYy6+zZat+Y5peyrgmR0l07oOvV5hoGWrTA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lQumhqiKmgAN9hTaXakEk99B6zBtnf1CiMS9fPiYhrvFGfef0WQwK7jhkzzjyJLwO
	 GAAti3Hv3aRNrLaFh/68c4xhxQt8y3+XFt9CB/DuQ6V40/LXUe+Lf0VSwMNCfhrKAj
	 M3we3FAUeyK3ffHYbt8fFBuGsjvtxBzuWv5n86k5wR8dwCiN05+GbVe+jFkPqv8yQs
	 kBMuIDYsFknZKj9wNBotyT5u/rc5RFUHnyFp3gdyn7euUbtmByXZvB8IulKl4/veTD
	 5R8pfd1tC/jAWUUj4we8/LkfKkIVkVAXVYnKyLsqDwV2bfDeQcCgTnzu6f37PH4S1u
	 gu03hZQ/xsp1w==
Received: by mail-ej1-f42.google.com with SMTP id o5so23159451ejy.7
        for <ksummit@lists.linux.dev>; Sat, 10 Jul 2021 10:18:30 -0700 (PDT)
X-Gm-Message-State: AOAM531dBq5KSFvw56/qOYRIUG8M/ZWobk1cyJc5QJjeRZgdDLsbHdkZ
	bwyd9fZw0HMROW1CN58SaYdU9XCj1+9L5VsHoxXq+g==
X-Google-Smtp-Source: ABdhPJw6sAN78uLIRhhhaTrISDcLncmMsHLZwXzbPbpphwG69kDgXTX87xQqj9l7V3B2yaZy6EsfOosccThflWQs96E=
X-Received: by 2002:a17:906:c34e:: with SMTP id ci14mr16650901ejb.199.1625937509111;
 Sat, 10 Jul 2021 10:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk> <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com> <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com> <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <20210708110852.1c4f8148@coco.lan> <YOnN5qTtauUEf+XX@pendragon.ideasonboard.com>
In-Reply-To: <YOnN5qTtauUEf+XX@pendragon.ideasonboard.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 10 Jul 2021 10:18:17 -0700
X-Gmail-Original-Message-ID: <CALCETrXbStLhO80n=HehDAXfysvKmJ=5PDD3WzdK3rdzXGAvdw@mail.gmail.com>
Message-ID: <CALCETrXbStLhO80n=HehDAXfysvKmJ=5PDD3WzdK3rdzXGAvdw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg KH <greg@kroah.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev, 
	Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 10, 2021 at 9:43 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jul 08, 2021 at 11:08:52AM +0200, Mauro Carvalho Chehab wrote:
> > Em Wed, 7 Jul 2021 20:17:08 +0300 Laurent Pinchart escreveu:
>
> > So, for instance, a regulator driver probably can use devm_* without
> > any issues, as it doesn't seem to make much sense to unbind a regulator
> > once the device was probed. On drivers like that, not using devm_*
> > would just make the probing part of the driver more complex, without
> > bringing any real benefit.
>
> Don't forget that regulators, GPIO controllers and other such core
> resources can be part of unpluggable devices.

It sounds like this type of use might be a good fit for a simple
precise garbage collector.  This could be arranged in C in a
reasonably safe way (with the assistance of sparse, perhaps).  Every
struct that could contain a GC pointer to a device would have a
special attribute, and the whole graph of devices could be walked as
needed to collect garbage.

Alternatively, weak references might be a good fit for this,
especially if hotplug is involved.  If a device gets hot-unplugged
without warning, every subsequent attempt to follow a weak reference
to that device could be made to fail.

--Andy

