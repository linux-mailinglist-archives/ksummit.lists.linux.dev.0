Return-Path: <ksummit+bounces-184-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D43A3399
	for <lists@lfdr.de>; Thu, 10 Jun 2021 20:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id D7FEB3E0F56
	for <lists@lfdr.de>; Thu, 10 Jun 2021 18:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E1F2FB9;
	Thu, 10 Jun 2021 18:56:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC370
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 18:56:05 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id r5so4826660lfr.5
        for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fRLZs+xpPU0awlv/sVbELYsIsLJoY4yzfXqdoTcuQ/A=;
        b=N7QJDxWDEjuPBEPA12jyVO3YWDYYqbNGXTo1BRgU5oCecpzdx8aNTH5DOHymsmQDFW
         bM6009FTN+jOq0LFqGFGMXMPP21MQXClexESyGzTEThu4AXhimLTKMLcGuhoQmMeObv4
         vKQi6VaJqiVAgxlZQuMHHR7MXSYsdMaF0cbPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fRLZs+xpPU0awlv/sVbELYsIsLJoY4yzfXqdoTcuQ/A=;
        b=fNrJxWzioMlwEg+I6hJfiR/kDM5/8U+9uqNNydmNOq0/UmxKHzGYZI3DV4VaE6l464
         qOuscqfsYMipjWRCZ/SiEzWytcJrhX7nEW4dCwN63wFdwuwEXVOgqM6/aMwhMtQCSYsG
         QlCkZqmzcc4j4qxyyXOP40/qCZGgqGv7vCVJRjn4dgyScT8dKu/+5WRBeeDW7OgQCODP
         LqGElyQQYPAGrwEdoNezpv5LLMWTeZ91SrvCEApyVyMIgafnzclxnbNSpKA0gwucMqbK
         FV3jSwDL/Qb0KYFkSRPvYcyrDUyxJoSDm9tFqFs5HNTymzCJKKIUKIGRlAySYCkJcAqH
         qxGw==
X-Gm-Message-State: AOAM533/MKzSLAsXz4Z3CxttbtEnS+LITRWh87vC/lCjdUbsXU97VtGw
	RGehQoXydPRibpC/9Gx9y9732LMikPmVam1j
X-Google-Smtp-Source: ABdhPJwbEKxhfnL9poU/ZLFxmC5cw4AD28SZVmpJbOG8HPzXZR4U/KLHQo7BxlKS3uvOmHVTbdQsVA==
X-Received: by 2002:a19:24d4:: with SMTP id k203mr151902lfk.271.1623351363476;
        Thu, 10 Jun 2021 11:56:03 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id o17sm375861lfb.114.2021.06.10.11.55.58
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 11:55:59 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id n12so4804588lft.10
        for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 11:55:58 -0700 (PDT)
X-Received: by 2002:a05:6512:374b:: with SMTP id a11mr149804lfs.377.1623351358045;
 Thu, 10 Jun 2021 11:55:58 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YH2hs6EsPTpDAqXc@mit.edu> <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu> <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com> <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com> <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
In-Reply-To: <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 10 Jun 2021 11:55:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiB6FJknDC5PMfpkg4gZrbSuC3d391VyReM4Wb0+JYXXA@mail.gmail.com>
Message-ID: <CAHk-=wiB6FJknDC5PMfpkg4gZrbSuC3d391VyReM4Wb0+JYXXA@mail.gmail.com>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: David Hildenbrand <david@redhat.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Greg KH <greg@kroah.com>, 
	Christoph Lameter <cl@gentwo.de>, "Theodore Ts'o" <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, 
	ksummit@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	Netdev <netdev@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 10, 2021 at 11:08 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> And I know *a lot* of people who will never take part in this generic
> human experiment that basically creates a new humanoid race (people
> who generate and exhaust the toxic spike proteine, whose gene sequence
> doesn't look quote natural). I'm one of them, as my whole family.

Please keep your insane and technically incorrect anti-vax comments to yourself.

You don't know what you are talking about, you don't know what mRNA
is, and you're spreading idiotic lies. Maybe you do so unwittingly,
because of bad education. Maybe you do so because you've talked to
"experts" or watched youtube videos by charlatans that don't know what
they are talking about.

But dammit, regardless of where you have gotten your mis-information
from, any Linux kernel discussion list isn't going to have your
idiotic drivel pass uncontested from me.

Vaccines have saved the lives of literally tens of millions of people.

Just for your edification in case you are actually willing to be
educated: mRNA doesn't change your genetic sequence in any way. It is
the exact same intermediate - and temporary - kind of material that
your cells generate internally all the time as part of your normal
cell processes, and all that the mRNA vaccines do is to add a dose
their own specialized sequence that then makes your normal cell
machinery generate that spike protein so that your body learns how to
recognize it.

The half-life of mRNA is a few hours. Any injected mRNA will be all
gone from your body in a day or two. It doesn't change anything
long-term, except for that natural "your body now knows how to
recognize and fight off a new foreign protein" (which then tends to
fade over time too, but lasts a lot longer than a few days). And yes,
while your body learns to fight off that foreign material, you may
feel like shit for a while. That's normal, and it's your natural
response to your cells spending resources on learning how to deal with
the new threat.

And of the vaccines, the mRNA ones are the most modern, and the most
targeted - exactly because they do *not* need to have any of the other
genetic material that you traditionally have in a vaccine (ie no need
for basically the whole - if weakened - bacterial or virus genetic
material). So the mRNA vaccines actually have *less* of that foreign
material in them than traditional vaccines do. And  a *lot* less than
the very real and actual COVID-19 virus that is spreading in your
neighborhood.

Honestly, anybody who has told you differently, and who has told you
that it changes your genetic material, is simply uneducated.  You need
to stop believing the anti-vax lies, and you need to start protecting
your family and the people around you.  Get vaccinated.

I think you are in Germany, and COVID-19 numbers are going down. It's
spreading a lot less these days, largely because people around you
have started getting the vaccine - about half having gotten their
first dose around you, and about a quarter being fully vaccinated. If
you and your family are more protected these days, it's because of all
those other people who made the right choice, but it's worth noting
that as you see the disease numbers go down in your neighborhood,
those diminishing numbers are going to predominantly be about people
like you and your family.

So don't feel all warm and fuzzy about the fact that covid cases have
dropped a lot around you. Yes, all those vaccinated people around you
will protect you too, but if there is another wave, possibly due to a
more transmissible version - you and your family will be at _much_
higher risk than those vaccinated people because of your ignorance and
mis-information.

Get vaccinated. Stop believing the anti-vax lies.

And if you insist on believing in the crazy conspiracy theories, at
least SHUT THE HELL UP about it on Linux kernel discussion lists.

                Linus

