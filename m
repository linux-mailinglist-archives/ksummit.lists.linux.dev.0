Return-Path: <ksummit+bounces-1269-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84C908D6E
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3884C284FBA
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69385E560;
	Fri, 14 Jun 2024 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOqmAuNY"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DCFDDA5
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718375564; cv=none; b=WqJXD2EHe++BkOS9XoA3lVgisZBySk8RuD75J9oUJGgaOeKLdz4N8Lxuo49t8Um2Dws4mDrWzZwHnYBVsfY3S9cscikfacTwSz4SN9Bsw9WEdO3cnQZU2DqCb7dXTKsKOcsrSB5H3cMqcCijEsyzsnjrcbi2J1Dw9P4O5yzYsVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718375564; c=relaxed/simple;
	bh=FneaIPldtjV8hw8yb0o5ye0MkxOEI5C1sw6GL0zDH6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0J9WoDnTBRwaHjnIBhE04+l4Z2uqeYxGNCP+WWKlZ2Ah94sgF3Ic/Opx0+G748EzIJshK2jnJ0DM1Tf98zKF0UxgaV7jAFYSQLrEgfToJJP587Jxxn1PVKu2AGH2OLza6PW8QSkwSdtJIR0LIG1ETBo0PB9/9IVVcfB65KDqUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOqmAuNY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76231C2BD10
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718375563;
	bh=FneaIPldtjV8hw8yb0o5ye0MkxOEI5C1sw6GL0zDH6M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AOqmAuNYx0qrLRw/5fxH3BXH7+TiDI53Bp7i5XYZ90qFucvgaWVUpUenKE87tfXSb
	 vql8GutrA8rDrF0xRQoJmvMIssQ9koysmx65kl3QWyhugoxxAzr3uEi5mQxA215NfV
	 I134i4JMwncb/5/L7R/OBlYDqvkiIxUF8Y1iBqEeK0ty3GTaimz/WYZ4XVVAL3JW/k
	 ipHscSYWpzbvq3CyhjSDkfHBG9ZR4xMEuKbVdgeVJW1ceRpSC9Mf710pdnN20fwtr5
	 3MO+C24tzKep+c8Vu1nG5DvBaXj6kNM5cGCP2mGsVuduPXQghZn1zBvWn8aOX7mTLG
	 xfnOjZU21nlSA==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5bb24436f72so61016eaf.2
        for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 07:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXHQwWSPeAFViVyT6nAlslN0zb0gfRMxY9amYiMOevvu8UH0IkTjPN9nmQiPhhipMRYUDV4hUGD/DO/XKadZKNc2sRswsBiHQ==
X-Gm-Message-State: AOJu0YxhE+S+fDq2Z41C161LW3lXWLKNzclxUfA71cwgIo7Yfb8M2+xH
	OV0y3UIhYiUq00i0KcAg1z/kmgBRm+B45bv4/ZYkHijfxQ9CW+OXAXXPRaQH4LjLv+I2zp/ejN7
	kbu1t705QLSWrT/hLWExAuvuU5Q8=
X-Google-Smtp-Source: AGHT+IGbcdKma6T6NkzDOe4jgLSj4B7Sjj/jdg5gSAC/Hy+mp2XEXYZ9vr+E7W9bfsC0X+fOgl9A69YPChleWYsy+Jk=
X-Received: by 2002:a4a:e1da:0:b0:5ba:ead2:c742 with SMTP id
 006d021491bc7-5bdad9f0343mr3103980eaf.0.1718375562737; Fri, 14 Jun 2024
 07:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info> <ZmxNPE0a8nB5YezI@finisterre.sirena.org.uk>
In-Reply-To: <ZmxNPE0a8nB5YezI@finisterre.sirena.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 14 Jun 2024 16:32:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iAPicQni+VZknF2d_JzW7TBT5fi87NK1hqiHTm5cvk5Q@mail.gmail.com>
Message-ID: <CAJZ5v0iAPicQni+VZknF2d_JzW7TBT5fi87NK1hqiHTm5cvk5Q@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression are
 fixed in latest stable series
To: Mark Brown <broonie@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 4:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Jun 13, 2024 at 10:32:27AM +0200, Thorsten Leemhuis wrote:
>
> > I propose we extend the implications of the "no regressions" rule so
> > that mainline developers must ensure fixes for recent mainline
> > regression make it to the latest stable series.
>
> I do note that there is already a bunch of disquiet about what makes it
> into stable...
>
> > """Developers must ensure that fixes for regressions introduced in the
> > last development cycle make it to the latest stable series -- typically
> > by adding 'Fixes:' and 'CC: <stable=E2=80=A6' tags to the patch descrip=
tion's
> > footer."""
>
> Personally I stopped bothering with manually Ccing stable because the
> stable team already picks up much more than I'm comfortable with,
> devoting any effort to thinking about what might go to stable just
> doesn't seem like a good use of time.

Same here mostly except for 3 cases:

 - When I want to limit the scope of the backports.
 - When I want the patch to get into "stable" earlier than autosel
would pick it up.
 - When there are dependencies I want "stable" to know about.

> We also already have problems with people spamming fixes tags onto
> things that are not really bugs or where not much effort appears to have
> gone into identifying a relevant commit, I think some people have
> internal process pressures on having Fixes tags for the sake of it.
> Demanding that people who don't really care fill in the blank to appease
> some workflow strategist doesn't seem likely to improve the quality of
> information provided any.

+1

