Return-Path: <ksummit+bounces-2554-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 947B0BE37B5
	for <lists@lfdr.de>; Thu, 16 Oct 2025 14:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 413733585D8
	for <lists@lfdr.de>; Thu, 16 Oct 2025 12:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D47A330D41;
	Thu, 16 Oct 2025 12:49:52 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467DA2E6106
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618992; cv=none; b=IymZK8fbmLYR19skKNq5q+Wr+14B5zWrrgLXCS5kU1h2zcW6ZYs6HCH22183oSRXgbLGyvK9XQxk9c16SFxxG5oljjX0u9jPuOocRfzPYlOURtV2lF6BSdkTwf6FqbsJ4NJ66jRyEIMUS+GgCV0vlPBfaRWaUjAcoZfk3qyZxGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618992; c=relaxed/simple;
	bh=ZunmHi2MPw5O7XsEG2+sgZduPF+ID6wBzLQHmTy2tEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3MJi90MpQTSwojFe33H2t20GkPJKrJq9TTGpcA8RHi/r1l6SHBklRYIKaLK40UdI3VfQwiJp1tz61GAUkFErwT/AIhWtRQXHiXiA/rw0stRi5w38bVcS5C3qBKwBsYcqLge5aO0JUVzc+6tBh/VmKgCu1RAYv6+afz1A1CkcMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-554f1c13bcaso502775e0c.0
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 05:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760618989; x=1761223789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TaVp2nMnfzYD4J2tcBlrTubfurIqUEcZSpuOEtYFmkI=;
        b=jN1JmWVno/tokWp+YN2sWKrH20nC6gloySm5CzutrWVL4TFDCOEY/SI3bxy9/JDtH9
         HebUIIJey5s5ME24aE5sBZ7zWTE88a8dmiqm0aHTfQzy/X2w1d2xjCZuUEij5oR9PhMP
         3bnGHghxFK8/2ESFPpT7Omx9iUTltvRGNeiMZ4FOPM6aslQpXEkU5n9Kh7xkPQMy1lGw
         DWsYUyUIAFX7HTK0lpClGHcHE/OndsmZX7oxPqB6IBbXNZfd6ikpizP4WMDbYLcP0yMh
         G4Bgxh5RfUIJU2MFW9O/LvItaJOp8e6wYI5eGQUHwVp6r4UQxbxWF5/hKzy/wIHdLELn
         7bdA==
X-Forwarded-Encrypted: i=1; AJvYcCVwDrFLNtd9z4ZGxqrqLuTYTDzxrPia+lCfc6pr6/9lFF/Z/vwC9b2QXa8IU/mSXnMaHCH4o6Zj@lists.linux.dev
X-Gm-Message-State: AOJu0YyMuKiqUFMiGFM7X8Quhy500UrN2fLuWrENGTfoclr/fnZsyBV9
	S1kUD46jm2r6tVD3mNT+oBFlAjUxwdn7GOjgIx51R8GRri0DBFbhkm8Et1JuRpbk
X-Gm-Gg: ASbGncv5VNhqdwKagK0KCVGmEGDgC4Z58qGNvKPGKDV7Y7UD110N9Ru3+65XPYFGAOu
	HWxU3ry4l+pz93Z9VwCCPExtroGXhH0hkjXI0+kyu2okTtNLS1vgyB1LtS29ibFgAYjhSoBrta7
	U/R9KFxZxJoS5dLbLzJqdGsQmJ3h8bU5jqC700iBpveONOFE/q4++ouCJVmN2q5hzV39o/Ze595
	xUcLWevhWyA24ga4iNB/Fbt+mBMtYmFoPjOrCE3Emd1zrJfisl/5YuaE/OrHzi27kAYJxOmDfEI
	lL70/GdfmM08Fd3T7LCu3BNkGnB9dozY5isFxLTBjQM/iBeeMVNcChGcGBLGsnTvt0MKKYNgVp/
	rSX0yNM38DzfmNwmM8OcyfNCel6WHnfdycROhU1jbkMiNIjSu2rvZmfqhIWbO5GAHNzpYERAmAU
	Wckd2yZczpQrD93C7NjAIoinhuG1veSRNMlLLEPUXVL0BsoR9p
X-Google-Smtp-Source: AGHT+IFuFtB2ozxxXacLrMYJ+1+Mvsa+wNaZ5NriYWoniO9lqBEBvr4J+Wx4MkQNwFR/YvxAd7QXxA==
X-Received: by 2002:a05:6122:32cc:b0:54a:992c:815e with SMTP id 71dfb90a1353d-5564ee91ac3mr24603e0c.8.1760618988865;
        Thu, 16 Oct 2025 05:49:48 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7ce706csm6113739e0c.0.2025.10.16.05.49.47
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 05:49:48 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso563599137.2
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 05:49:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6Pr+covE9StcR+O5QFbwi4t83UuuS9kxiRV5YqpOqBofMsQbXEHLcxxicz+4dno4pSIrXyoz1@lists.linux.dev
X-Received: by 2002:a05:6102:3f0b:b0:523:759e:b0bf with SMTP id
 ada2fe7eead31-5d7dd5ba685mr40028137.20.1760618987486; Thu, 16 Oct 2025
 05:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch> <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch> <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh> <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
 <2025101639-thwarting-press-f0f7@gregkh> <1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
In-Reply-To: <1de36a0c-a197-441d-82eb-29f96581a8b2@efficios.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 14:49:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi4wtSUpq-GUv0ggHtC1ZESkuHwRc3Y905nUzi0=juEQ@mail.gmail.com>
X-Gm-Features: AS18NWAP6Z9_B60tm06a2BKXvpy2xZsbpVlw8tNpN_SMmlnoDfDycXt0HJIanRI
Message-ID: <CAMuHMdWi4wtSUpq-GUv0ggHtC1ZESkuHwRc3Y905nUzi0=juEQ@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, dan.j.williams@intel.com, 
	Doug Anderson <dianders@chromium.org>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Matthieu,

On Thu, 16 Oct 2025 at 14:35, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
> On 2025-10-16 08:18, Greg KH wrote:
> [...]
> > Be it a link: or a message-id, or something else that I
> > can "set and forget" in my git hooks and so can all other maintainers.
>
> I can't help but keep thinking that we are trying to solve a problem
> that is fundamentally just about namespacing with needlessly complex
> technical solutions that will degrade the workflow of many maintainers
> across the span of the entire Linux software development process.
>
> The "Link:" tag is unfortunately a bag of holding for all sorts of
> links. So if Linus interprets the "Link:" tag as a link to relevant
> URLs with an implied meaning "see also" or "more relevant info
> here", then whatever else gets added under "Link:" with a different
> purpose is seen as noise.
>
> One possible solution would be to introduce a new tag such as
> "Link-Origin: https://..." or just "Origin: https://..." or
> whatever better name we can collectively come up with.
>
> That way the semantic should be obvious to everyone.

We already have a way to distinguish:
  - "Link: https://patch.msgid.link/... " for the original patch email,
  - "Link: https://lore.kernel.org/..." for e.g. the big upfront design
    discussion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

