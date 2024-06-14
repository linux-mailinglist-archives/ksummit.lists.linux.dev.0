Return-Path: <ksummit+bounces-1275-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A33908DB7
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AF3F1F21C8F
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FD6107B6;
	Fri, 14 Jun 2024 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhtH7lkN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EF4A3D
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376256; cv=none; b=iWZyncYeMrqxJVbUoN2TjKVtJ36N9aMF7jqOGCIJhqFBdHj5xdVoRbuX2/glZaQ1aZu8JVRN7zlos5jezh7P4JXcCDhK+JWNSbjAM+ZvN5mFJUJfHfz6wd6kEac3RY3v/RNfYt/6vXHP1GlMrT5bw6JeEXOMGagt2E6vtAAnWVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376256; c=relaxed/simple;
	bh=gUs5KRcv4DdrAEJWNDi5v6cSf7aMPdUBWGWRsEJ3q1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bwx2Fac7TMNNyMgjCcbnGbtEEooaAvp8SwLz+61EROg/v9TmgHVzyfqSofvbFtH4pPZIhVVjj5gwtDfx7ljtdJYPnUQFv6IALgFUX/NFZ52UWI8XBPp5uVnmPa5p7YMlvS6fBRwmV+VXhTuMvPgQqV6UzZXuBe+QdvAQudk1JdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhtH7lkN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD77C4AF1A
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718376256;
	bh=gUs5KRcv4DdrAEJWNDi5v6cSf7aMPdUBWGWRsEJ3q1g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dhtH7lkN6DAJL0rzI5ftu/T7k0TPtoPIvD65bg/pdzOTNG1yEbfdlmFqR/VxQRjaC
	 mAf3dPoAgbQYdkQjQcopB87Ez/TQJQMWFekNskboFGGDSUj9kfeE2jte1a0wUOnZjh
	 FFa9711gVwqtVwYNfNitQ6V55ScoT2izpfBk+B1GMs5wYlG5YAzZ+TPIx3LKoioy2R
	 e48JM6r2d9b/TBMDbeNhlNh5SYEUtQQ+d5EfO5FcPaGH4naQD79BtUMIO3QbPHhpgc
	 a6bSZy7R5xjCDkKg1FVVAH1hLOZ/5tx65LtO/0qj/0mRuOV7IoLoSrOVUGU7yGQYjz
	 E342mwTqZH6kg==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5bae827df63so118516eaf.3
        for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 07:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2cJTI3Y/vIOKV64evz8WxFz5OVPoKYF3qpBaBF73hopfR7fsGKCAPsgJBhLCSY442y9D36AQv6LTMh5pNSYbV+vLXXBN4dg==
X-Gm-Message-State: AOJu0Ywb/DGxfW+tfoH1p3FN81WNxYgAFMm552g9Y7TCEm8mxJ6q1VyU
	+eagD/wXYVohvpQVzeERmZfQLZMsXkrjGYTASMBBi1RWMUxzdfo7x7kkgD1Qo/bjhEO4JKSRSM2
	C3UYcw6iOZQoyXiSnWhWqf5E1g88=
X-Google-Smtp-Source: AGHT+IEB2OjhLulDvxXi40fmco8DRoGRZhQWucLrwsA7HRiCtNY5Qrrjt1mV2BDJzS4SJ1fZruiMJlNCd6itnAYAYd4=
X-Received: by 2002:a05:6820:287:b0:5ba:ca8a:6598 with SMTP id
 006d021491bc7-5bdad9f3131mr2803730eaf.0.1718376255605; Fri, 14 Jun 2024
 07:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse> <20240614-almond-lorikeet-of-reading-6d959f@lemur>
In-Reply-To: <20240614-almond-lorikeet-of-reading-6d959f@lemur>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 14 Jun 2024 16:44:04 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hbzGWUZ_J6TN1rSVgrFBXvJA19C6UkRKsv8ssYo7uqew@mail.gmail.com>
Message-ID: <CAJZ5v0hbzGWUZ_J6TN1rSVgrFBXvJA19C6UkRKsv8ssYo7uqew@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 4:38=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Sat, Jun 15, 2024 at 12:29:09AM GMT, Michael Ellerman wrote:
> > > 1. disambiguates Link: trailers so they point to relevant online disc=
ussions
> > > 2. allows tooling like b4, patchwork, etc, to reliably match commits =
to
> > >    submissions for the purposes of better code review automation
> > > 3. allows stable and similar projects to better track series grouping=
 for
> > >    commits
> >
> > Message-Id: sucks, I want a link I can open with a single click.
>
> But why would you want to, on a regular basis? Viewing the series submiss=
ion
> has got to provide near zero useful info -- if it was accepted into the t=
ree,
> then at most it would have a couple of stray code review trailers.
>
> > At your suggestion I switched to using https://msgid.link/ as the targe=
t
> > for patch links, eg:
> >
> >   Link: https://msgid.link/20240529123029.146953-2-mpe@ellerman.id.au
>
> This is still my recommendation, but it doesn't stop someone from using
> msgid.link URLs to link to actual discussions. It also doesn't solve the
> problem being discussed here -- reliably mapping commits to patch submiss=
ions
> for the purposes of automation.

IMO anything short of a new tag wouldn't help.

With a new tag, say Submission:, pointing to the original patch at
Lore, this could be addressed.

Of course, people would need to see a clear benefit to adopt it
because it would require some extra work to use.

