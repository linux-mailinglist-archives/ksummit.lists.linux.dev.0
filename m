Return-Path: <ksummit+bounces-2559-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CEEBE39D3
	for <lists@lfdr.de>; Thu, 16 Oct 2025 15:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B88419C722C
	for <lists@lfdr.de>; Thu, 16 Oct 2025 13:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B6B32D7DC;
	Thu, 16 Oct 2025 13:08:01 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56E6F06B
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760620081; cv=none; b=rJjHVYly3q4OTOSBGdOoKzUNCb+2ch8eDjtVQ/eJyAekZIFVqBSPs9ZlOSPS8j9aHfN2qflVq6Ss9jkiAZr9i1mGJ6EnjBwixf0PudPsMTXQ4vkgBjjHa4rlW0KOYdjMVIpyfXOZ+wSgQq7hmg9bqZhdaBcFbgDiWy+V7PPsj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760620081; c=relaxed/simple;
	bh=7jErKPU0Nqp1wwWf52YrcU3IbjNrOrM30r1L5kZK6PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dakuGMFWKUlbdO+870hwnBjQwgI5joZfbnv7JKv6X6PMtQ5ig8vxiCsm1SeE1UUK2djQCIIP/FIw6cWKHFy7KZbrW/vJhMbBfYGVvGtRmvrTHHUKiXKmd8N7HyUHt7uFN+ZNTOyofeVAGlGHc7CA8kDmHl9s1KMnQkelc3tRKBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-930c4cd6ccbso438985241.3
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 06:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760620077; x=1761224877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYC329XpwFf35RjelYf+KGpqh62HZlg47RzFzcFyAbg=;
        b=Hu90ie6lUTGUAkRhD/RxTZAQ61N9ziDFyH5zz2PpP/0f7K5AI2TvOf36qDlfb6FBSw
         Q7szeIrGP8fUEjXU4+V/cpjEPJpvmbsLgwr/h/gvttXy0slnDfLELgCMwWs35rD5GtE+
         8IUNaNRj4ROscLBay0PgC6cm3rnl4Y16lYw5ReziPQQKd8e7zXRLHwkkaGOCN8Pw3gPo
         fLdDFHY7qQz15FNSMVHdhPFlIZkuNbIqnhzxCEn/AYiZksyXia+c0ChU7rV39KUlvq7l
         aU4MqXh6Ky/RyDHjv3ukMHX2S4BnozyPeA/w+UVKz/wdcL7P1jO9goK7cvEW9/ylZ9ej
         eAKg==
X-Forwarded-Encrypted: i=1; AJvYcCU6/wLmftnMYh85q50V6QSoR76EPfmWewu8zwHqBS6UBW60460ofOVm++5NcQMu/CmT4pL/qLTb@lists.linux.dev
X-Gm-Message-State: AOJu0YwADGcqXhjMxmbPuOpTv99htn6WnUodWJ39YugaIwp+3gfJSYGg
	jvBjC3w4aV0nohCZF8KFR19V64AK8GBS1kSxnO4aRz2aW3ld60L+Y3+WHuukBViY
X-Gm-Gg: ASbGncuHB3RoPOIBiHRAzchz+D2bFA/1mt8s3p5gej7Z/A0i3f7P4hSaaPcUKXbF2F5
	hspkLQU4wur3K0iRt37A5EdOaz+DFdsWAokD5XMCxftKI0opMdO55CufLPz0o6rTBZMrFq3BduK
	wXSvRCME3bv3zLGUXH5ElYhTJ6g6kX6o0qGpVz4RUCv+QOyFlEFQgQl7zAff3qlIWyMoF3GBLCZ
	JZJgSDf6br/fyp3sMeDH73WVik9JJ69o+FTrya3scmUEQhJJ4F+R+MlwLao5wyJWN13QXP3zWUp
	X75mgSZP2Pf8ot9ChX/k5bKPuQGNTQ+2xO812mUNrBYPiKqKBzC5LPR4KjLoHdBcHUkI0IHncWl
	zKGObKKYMfXY1S8KaV3AUMZE5c+rXyHde7HyZqt7VVxQczVvg5pYazkA7yjc7+Ep/AHRqY2/Y/C
	jXrDrsC0cvvhEMZ8rf/Tt3vNRNR60WFWLS/cpZBA==
X-Google-Smtp-Source: AGHT+IFe0yI4F+fsTaykWszByc1T/i9QRiTi4skAC6onr05h2tc0hunEurOugl5/AJm0ty0Ag4ug2w==
X-Received: by 2002:a05:6102:161e:b0:519:534a:6c50 with SMTP id ada2fe7eead31-5d7dd5ef83bmr91763137.34.1760620076973;
        Thu, 16 Oct 2025 06:07:56 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc8b165dsm6249801137.9.2025.10.16.06.07.55
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:07:56 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso581010137.2
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 06:07:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNbKRaZMrlCPAjoNTEOpo1gxpCeNK1r3pa/OygJ+VGLeEmjNbek6YtaRELGRxxGmDMqhewDCWg@lists.linux.dev
X-Received: by 2002:a05:6102:cd1:b0:5a3:5b69:b963 with SMTP id
 ada2fe7eead31-5d7dd430a6dmr91969137.7.1760620075557; Thu, 16 Oct 2025
 06:07:55 -0700 (PDT)
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
 <CAMuHMdWi4wtSUpq-GUv0ggHtC1ZESkuHwRc3Y905nUzi0=juEQ@mail.gmail.com> <981e4252-6adb-4214-a8b2-e6411a19eb4b@efficios.com>
In-Reply-To: <981e4252-6adb-4214-a8b2-e6411a19eb4b@efficios.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 15:07:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWM8n9hU7ROkTWXS6XZ7d_BDovorVGSbtj-NCq+wmHUdA@mail.gmail.com>
X-Gm-Features: AS18NWAW7eAUlZBdAlwKwSkxQrJ7m30SyALjT-EV_FkxIzp8SyjI1_ZXpLW-8zU
Message-ID: <CAMuHMdWM8n9hU7ROkTWXS6XZ7d_BDovorVGSbtj-NCq+wmHUdA@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, dan.j.williams@intel.com, 
	Doug Anderson <dianders@chromium.org>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Matthieu,

On Thu, 16 Oct 2025 at 14:54, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
> On 2025-10-16 08:49, Geert Uytterhoeven wrote:
> > On Thu, 16 Oct 2025 at 14:35, Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> >> On 2025-10-16 08:18, Greg KH wrote:
> >> [...]
> >>> Be it a link: or a message-id, or something else that I
> >>> can "set and forget" in my git hooks and so can all other maintainers.
> >>
> >> I can't help but keep thinking that we are trying to solve a problem
> >> that is fundamentally just about namespacing with needlessly complex
> >> technical solutions that will degrade the workflow of many maintainers
> >> across the span of the entire Linux software development process.
> >>
> >> The "Link:" tag is unfortunately a bag of holding for all sorts of
> >> links. So if Linus interprets the "Link:" tag as a link to relevant
> >> URLs with an implied meaning "see also" or "more relevant info
> >> here", then whatever else gets added under "Link:" with a different
> >> purpose is seen as noise.
> >>
> >> One possible solution would be to introduce a new tag such as
> >> "Link-Origin: https://..." or just "Origin: https://..." or
> >> whatever better name we can collectively come up with.
> >>
> >> That way the semantic should be obvious to everyone.
> >
> > We already have a way to distinguish:
> >    - "Link: https://patch.msgid.link/... " for the original patch email,
> >    - "Link: https://lore.kernel.org/..." for e.g. the big upfront design
> >      discussion.
>
> What I'm trying to figure out here is whether Linus is aware of this
> implied namespacing within the URL, and if we can improve the
> situation by lifting the namespacing to the level of the "Link:"
> tag rather than hide it under an implied semantic within the URL.

I assume so, as AFAIK it was created exactly for this.
Oldest reference I could find:
https://lore.kernel.org/all/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

