Return-Path: <ksummit+bounces-1311-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DD90B786
	for <lists@lfdr.de>; Mon, 17 Jun 2024 19:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 809FD2843BB
	for <lists@lfdr.de>; Mon, 17 Jun 2024 17:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2896816A940;
	Mon, 17 Jun 2024 17:11:41 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24431684BF
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 17:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718644300; cv=none; b=glBkBnP6lRhTkJDL9PT66+xacihmWs6kNpLqJ5wVLrs9ZAU47hpZrsJqy7hocX8ciaWCbIUTUjWbB6SpZsqEt4Uc5mpbm/HGDZKFuvGJV/o/r70vK3yQ+L46YBqj8+tygDAglTeAYPZTQauJsNDjVErWgUZKvF0pLMsasO83/W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718644300; c=relaxed/simple;
	bh=UKm3fqRzmQajRaFhP92VrxmkIvypXLpGehRK8k4fWh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhMWBMZhkuXSurzeKUd5UiE6EqQMaT8fQY5+yiqKxx+0KvofovTno7XKgXHv2ctl9vmZYOZ3e1H7U08Ie0a1NhXDjCn+1MlPgheNiWn1Aa1+udJiZ14Dn2Xqo4BBYbyeaJUyTvUg5GHCJ4pVIH4EDgzzB8riOu6Mm5/0wW5Kfvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-63186c222eeso41031997b3.2
        for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 10:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718644297; x=1719249097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAPTusat/z8914ilquplWUPHit60yqwbYlTYMmCk63c=;
        b=KzDZILob2e1fTmDbywc8TfmvZhDyjn+fImGm0FtYeZ/d5g4+W04PUORlGTlWPAPsCj
         f4nlJ481P88r0aggB/QzDClLeQpwJHATIbvhMcKE2kPxGj4fZYParlthDi9WDIeC7pzu
         vBnlSzbQopZM7ItyKU8ay3+FALVXzXoRdX9Lm2IjkamonPgC3alQGEOu1IVyGV1YtpPi
         Up6xRfoc/cYgDo+NVjHXO0vIXLFAvLTAOl7rz30dlPo/WBbkzgryGHnKi0Wgu3iqjRC2
         bPmFfY75zyEq8dtxe54QSRRyB6szYcxJrwMITUKWznlqL2Nu8I9QnNXH835twEvEbKUz
         Zzvw==
X-Forwarded-Encrypted: i=1; AJvYcCUmq4OBTUjjo6BTbIkISpCpnDhr7OUWOXoyVC1TAsfwEjTJ3gfS5g9av9WKgwqAU0gZAqI+X2Q9yGSeRE24MWzkFlKv4AegVw==
X-Gm-Message-State: AOJu0YzYA1x5SARiShJ7IYeDJS6fEhWC4koW6vIVifyEy61NTf4Y1qnD
	LdOk1pACDoiIf2fIiKLjmB64w/mOz0mmt4uzIh3Wq00L9aRF/IDXzISA1qmk
X-Google-Smtp-Source: AGHT+IEbbCo+1JArKRw7qq5/DWnePlPTuSC643lc0O/rQc+x/lgRcCI5sxENeBS0zgnplfOtAil0dA==
X-Received: by 2002:a81:6f55:0:b0:631:4a11:87eb with SMTP id 00721157ae682-63224a0a5e9mr95101737b3.39.1718644296214;
        Mon, 17 Jun 2024 10:11:36 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311ae10068sm14910267b3.126.2024.06.17.10.11.35
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 10:11:35 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-63186c222eeso41031447b3.2
        for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 10:11:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+HB06e88pGm+4SJe9T63JoJt0gQJ/7p6x09EeQusuCD2E0Tlv1H8knNSZLvjtoz1Y8Liz8C1PXUV11QHGbRyyEdUerPBYhQ==
X-Received: by 2002:a81:be02:0:b0:631:43e1:6b99 with SMTP id
 00721157ae682-63222a57ad3mr98554867b3.12.1718644295131; Mon, 17 Jun 2024
 10:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240613095917.eeplayyfvl6un56y@quack3> <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse> <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home> <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
 <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat> <1ff23e26-0099-4826-bb79-4928507edce1@paulmck-laptop>
 <20240617-inventive-bumblebee-of-champagne-e133bc@meerkat>
 <79b5f7fb-28b1-441f-a064-eb52be0d20da@redhat.com> <20240617-crazy-cougar-of-romance-becc3e@meerkat>
In-Reply-To: <20240617-crazy-cougar-of-romance-becc3e@meerkat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 19:11:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1eVOJSTTT1pEtnp8_YojMspzCdYs0KdwzHVPwCuHi_A@mail.gmail.com>
Message-ID: <CAMuHMdX1eVOJSTTT1pEtnp8_YojMspzCdYs0KdwzHVPwCuHi_A@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Takashi Iwai <tiwai@suse.de>, 
	Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Mon, Jun 17, 2024 at 6:57=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Mon, Jun 17, 2024 at 06:14:48PM GMT, Paolo Bonzini wrote:
> > > - Link: https://patch.msgid.link/20240617-arboreal-industrious-hedgeh=
og-5b84ae@meerkat
> > > - Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgeho=
g-5b84ae@meerkat # patch
> >
> > Two questions:
> >
> > 1) just one is needed, right? (should go without saying, but still)
>
> Yes, either-or. I just need to know which link takes me to the original p=
atch.
>
> > 2) Is the "/r/MESSAGE-ID" format (https://lore.kernel.org/r/20240617-ar=
boreal-industrious-hedgehog-5b84ae@meerkat)
> > not valid or deprecated?
>
> It's valid, but /r/ has been unnecessary for ages.

Care to update
https://docs.kernel.org/maintainer/configure-git.html?highlight=3Dlore.kern=
el.org/r/?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

