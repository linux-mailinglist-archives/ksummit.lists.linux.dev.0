Return-Path: <ksummit+bounces-863-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E05F2552
	for <lists@lfdr.de>; Sun,  2 Oct 2022 22:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940DA280A8B
	for <lists@lfdr.de>; Sun,  2 Oct 2022 20:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8EE3D78;
	Sun,  2 Oct 2022 20:46:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8673D6A
	for <ksummit@lists.linux.dev>; Sun,  2 Oct 2022 20:46:33 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-131ea99262dso8769626fac.9
        for <ksummit@lists.linux.dev>; Sun, 02 Oct 2022 13:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GA1eijPhe2qLHfwUccL2m31o18WRn+HtU/gv3+g46xc=;
        b=OQ5Fdojd2dOl5xXkqKGgU5wBp9DAbTQrcyIlOkSTvNgzB+qErBRKm4zcjxEI9C4Trc
         KNjmKitUVAp3JCwG2LUbHYnaMpen+vbGQxlsJperGdZuHM8s4F9EwhUbN8CR2zsL7RyE
         KeOYBIUftyho6wUoyQTJmezJBUVx4kY5Bed5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GA1eijPhe2qLHfwUccL2m31o18WRn+HtU/gv3+g46xc=;
        b=tIGESuYrGyjbVnuocjFMVXhWEhn1XP/Vbngarf5iUbhTVF8Xcj4YIMes2MIthcE8BB
         AUJwWhzJ0i4N77vQ/4HpcBfMNVHElu5KzOT5nupQG7CMAvNhgiziIvnzb/7xTNBkmO5L
         nVHxrKcE5sF23qq8GBepV/mY35YPBVce6K0bCa2Ns9Cty9Zm+xTFldBZnTZ5SVpi3MUP
         lH4LsPVYOsR73e+BcEK2QJrtTLiUq7sY1IJWjgAfQGuGNUAGTleLUq5eM08iA/9EnVVw
         T9F1ck3/bCzjN6IER2CfBVshhmmfA2Pv0plJUL7b/STwaJM3W/5vpGTB4x9vH5bEoC0W
         elrA==
X-Gm-Message-State: ACrzQf2W6d69rUz4ww7YrgcLUbwIK0C1LYqzqXXzvlOCqvd2+RKJPxmN
	ebAzENBn78tfOEDrSvRi6DDa+80pZpti+A==
X-Google-Smtp-Source: AMsMyM5e8yJl/zYBU1waxb3x/WCqrTFlE4481mcBwHt1DaOnmmo1PrGiiub+sod3cqNHxaQT5loDaQ==
X-Received: by 2002:a05:6870:f6a8:b0:12a:e852:e05b with SMTP id el40-20020a056870f6a800b0012ae852e05bmr3754184oab.15.1664743590000;
        Sun, 02 Oct 2022 13:46:30 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id g26-20020a056830161a00b00616d25dc933sm1977587otr.69.2022.10.02.13.46.26
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 13:46:27 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id u19-20020a4a9e93000000b004757198549cso5630909ook.0
        for <ksummit@lists.linux.dev>; Sun, 02 Oct 2022 13:46:26 -0700 (PDT)
X-Received: by 2002:a05:6830:611:b0:65c:26ce:5dc with SMTP id
 w17-20020a056830061100b0065c26ce05dcmr7102608oti.176.1664743586515; Sun, 02
 Oct 2022 13:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com> <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com> <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <YzmhoglDyEf3z0n8@kroah.com> <ce0b5780-a8cd-83fc-5b91-3acc574f426e@gmx.com>
In-Reply-To: <ce0b5780-a8cd-83fc-5b91-3acc574f426e@gmx.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Oct 2022 13:46:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiGZEGY7kDXSD3ryL3yJ6fMp-+zzdyRFUc30kW+512-2w@mail.gmail.com>
Message-ID: <CAHk-=wiGZEGY7kDXSD3ryL3yJ6fMp-+zzdyRFUc30kW+512-2w@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev, 
	Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 2, 2022 at 12:27 PM Artem S. Tashkinov <aros@gmx.com> wrote:
>
> It's so weird to read this I'm just dumbfounded.

The *real* dumbfoundedness here is how you seem to think you have the
right to tell people how to work, when you've been told over and over
how bugzilla doesn't fit in the workflow, and isn't worth the effort
and time.

And when people tell you that if you care about bugzilla, then it is
*you* who should spend the time there, you say that you are
dumbfounded. Because only you can tell people how they should work,
right?

Please go away, and look in the mirror a bit.

                  Linus

