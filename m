Return-Path: <ksummit+bounces-311-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C523BF0D1
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DA15C1C0DD4
	for <lists@lfdr.de>; Wed,  7 Jul 2021 20:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D8B2F80;
	Wed,  7 Jul 2021 20:39:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F97168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 20:39:41 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id u18so7601495lff.9
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CxhEcHoe5y03vDGBPIiOnnYyJm4uZQ5HD72NGyAkxq4=;
        b=LE0+eqZW51pO3x3Zfv+VVLvQDvyrgz7XPH4ZfkD/W+P9qIyIlcgv/JFyGtVMuTPs8B
         tCAzDibJUhz9y/anVEiw4ZBO0veUoWEH7KvEBoiFO8i8A9TJ2OB3PFrBT3MYNMFYmwXd
         P5USDrJ5eCgIgdJC46KVb4ZGuNklhe++Sc1b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CxhEcHoe5y03vDGBPIiOnnYyJm4uZQ5HD72NGyAkxq4=;
        b=jHmFQ1sqAuBc+i/B7uQOsCfmzhyfveLotnNJXYmfFSzc6tB7FGZ6jktl5J4vcOF2nF
         YkX/OOlYIVDLpjmdXtJqJk0USs12VILWu8nqkyvGZInibgfA6Gp5D/dDOFnKmcbcz8gI
         79QPZjycJF0e0JEXARycGS9XUyNspwzdOioShb2SbZUgub2VRkLHJP2JuCAk1POWoa3g
         SBReatQiHqZORZWFZWmROVdtpoPkhxC95IpqaLA/nzVGmIjrm0yN2pnPwS0SQJA51rQk
         jOTBGD94xa04uVhAmHw3DSqboWU9uA5AJ225m1uBg5pZt1lGOPkGiEN1g6UrYXo/49io
         DhPw==
X-Gm-Message-State: AOAM533TlN/2VeSWr6l1QZBY+WtGb5SlW2VUT5+jcvLzl0OzC9/8jgxA
	4IS7eVRdIm565IDGkvKgILgewvr5YoiJA1QKJv0=
X-Google-Smtp-Source: ABdhPJyvxAW/zP5qqPM8IQzyLStsy4zFcrRysSsodjXkepiLB9X2IHOTnenxIpq4RZ/uTfGrU40Btw==
X-Received: by 2002:a2e:9d59:: with SMTP id y25mr20662414ljj.399.1625690379481;
        Wed, 07 Jul 2021 13:39:39 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id r11sm5435ljp.9.2021.07.07.13.39.38
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 13:39:38 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id a18so7558262lfs.10
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 13:39:38 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr19914126lfa.421.1625690378222;
 Wed, 07 Jul 2021 13:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org> <20210706160857.6d4c63aa@hermes.local>
 <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org> <CAHk-=wiwZWAo_Ki587FD2BrAQVK71TBN=uKimdBf1Pxg3=+nTw@mail.gmail.com>
 <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
In-Reply-To: <22460501-fe09-f8e7-1051-b6b692500859@acm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 Jul 2021 13:39:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjYGDtLafGB6wabjZCyPUiTJSda0c8h5+_8BeFNdCdrNg@mail.gmail.com>
Message-ID: <CAHk-=wjYGDtLafGB6wabjZCyPUiTJSda0c8h5+_8BeFNdCdrNg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Bart Van Assche <bvanassche@acm.org>
Cc: Stephen Hemminger <stephen@networkplumber.org>, Roland Dreier <roland@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 7, 2021 at 1:32 PM Bart Van Assche <bvanassche@acm.org> wrote:
>
> Thank you for having shared your opinion. You may want to know that
> every C++ project I have worked on so far enabled at least the following
> compiler flags: -fno-exceptions and -fno-rtti.
>
> What the C++ operator new does if not enough memory is available depends
> on the implementation of that operator.

The point is, C++ really has some fundamental problems. Yes, you can
work around them, but it doesn't change the fact that it doesn't
actually *fix* any of the issues that make C problematic.

For example, do you go as far as to disallow classes because member
functions are horrible garbage? Maybe newer versions of C++ fixed it,
but it used to be the case that you couldn't sanely even split a
member function into multiple functions to make it easier to read,
because every single helper function that worked on that class then
had to be declared in the class definition.

Which makes simple things like just re-organizing code to be legible a
huge pain.

At the same time, C++ offer no real new type or runtime safety, and
makes the problem space just bigger. It forces you to use _more_
casts, which then just make for more problems when it turns out the
casts were incorrect and hid the real problem.

So no. We're not switching to a new language that causes pain and
offers no actual upsides.

At least the argument is that Rust _fixes_ some of the C safety
issues. C++ would not.

            Linus

