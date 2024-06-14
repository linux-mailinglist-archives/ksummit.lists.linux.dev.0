Return-Path: <ksummit+bounces-1278-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1124908E39
	for <lists@lfdr.de>; Fri, 14 Jun 2024 17:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 681CF28D633
	for <lists@lfdr.de>; Fri, 14 Jun 2024 15:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8412195B04;
	Fri, 14 Jun 2024 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wd5XdVRw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4A0196C88
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377410; cv=none; b=IGxDtMDkipneCSNyemXZb3yQnWluOZRUkFkJmUnuAczLiZKPPNjfB3Ep+WrDvk8TQfM1WKTmB5Mjh/cNSL1BEnfeTFffYkTDpcLpOacb7uFXQqZcbAKpslOnpLTixCFitKrhmg0ZGU2rGWhvCCCjl6luWCVmEHuKztqWuGVdR0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377410; c=relaxed/simple;
	bh=2MH30jVYvIYT3CifiOqWTeCAbkpMktCGML732IySsQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qx40xfyHKoBiiTxtf+ItERJUW8jOzV5Ncw+mYdv0lkQNic8YbRdsEpQ30nYah4rwf56qnd//V2nVCYYlKNH1gTm49TJ0TiPNUIV3/7J+CjNJ3TtxyIaobAKxmywGT2bw8SyJ27NIwMCD97F+O7VKmeNZ6kqglS3ZOu4Kuxg0tLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wd5XdVRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E85C4AF1A
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718377409;
	bh=2MH30jVYvIYT3CifiOqWTeCAbkpMktCGML732IySsQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wd5XdVRwEno8iHYpvpNrgLV98/Dalm2191e4fGz4iGJSwbEwHwbhg/rXoWvJW3OTp
	 +Lj1WW29zIt0VfvgcJdUm+dRyIoL3cx4Urk3Jsp1ZK83QNDrIxu1HUFmmgSJeOxKbu
	 6iyUqdBipA2jCfHxjxuLn4PGVLUoM+ynsyOOlKPS2XmAsRiL1EgG54wyI9tm8pFt7+
	 vWcrr42SccDb5MVU12rwFOr5vMDrAUVPuonlfZa05d67/tIYFSf3UFxE1Ds1T54+VG
	 V0DjYouTY9yoX/KQG4CTqINpBJUsVeVku13m0cBohzFE6ufOyyKeEaFpojE7WJYoaN
	 qVgq12qX6jOJg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b99ba97d89so108294eaf.1
        for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 08:03:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHFrJVU7FeB2w8Rg2sn+/1zyE7RlcRuVDGNq4pwWIlGmJhpfHeO2CzxWlyi1N+/8+jCfrROJ+nnY0CwcKnD0UvqKVuLMivNA==
X-Gm-Message-State: AOJu0Yw11KDAnp6jSBAhcoHD4f+9SWku1q+DgGKh4MiQexirzlDawFj1
	9gOB6+8z9qIKbBPXjs2WXbRCw9LPl8ziq88lm3g2zlexBtbx23ZlSlEvmhJxAdc568ecT3J4wcu
	4JRLTxk6cn+HOQizuR4CyWFIMEDQ=
X-Google-Smtp-Source: AGHT+IEWLqtBFtqg6jTcI7J/2Pe+gcrI3pq9BtXA2kXArYkzbPbsE0i7k0omVh6F85+yCudcMRtU7KiU0+FsUiOgo+Y=
X-Received: by 2002:a4a:e1da:0:b0:5ba:ead2:c742 with SMTP id
 006d021491bc7-5bdad9f0343mr3188602eaf.0.1718377409171; Fri, 14 Jun 2024
 08:03:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <0db30bc4-b646-43ec-bc0c-3b8b1372799d@lunn.ch>
 <Zms3F12AXGhErOrV@sashalap> <20240614144151.jun62q24lki5aqhj@quack3>
In-Reply-To: <20240614144151.jun62q24lki5aqhj@quack3>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 14 Jun 2024 17:03:17 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ih24UOwt9PpHYN3Cc868cwRzwj0eqk1v6kKq5Ca2oCVg@mail.gmail.com>
Message-ID: <CAJZ5v0ih24UOwt9PpHYN3Cc868cwRzwj0eqk1v6kKq5Ca2oCVg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Jan Kara <jack@suse.cz>
Cc: Sasha Levin <sashal@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 4:42=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Thu 13-06-24 14:14:47, Sasha Levin wrote:
> > On Thu, Jun 13, 2024 at 04:28:47PM +0200, Andrew Lunn wrote:
> > > > * One cause of regressions that happen in stable trees (and not in
> > > > mainline) I've seen quite a few times are backports of commits with
> > > > Fixes: tags that were part of a patch-series and depend on earlier
> > > > patches from the series. The stable-team afaics has no easy way to =
spot
> > > > this, as there is no way to check "was this change part of a series=
".
> > >
> > > This sounds like a tooling issue. git send-email knows a patch is par=
t
> > > of a patch series. Maybe it should be adding some sort of cross
> > > reference between patches in a patch series.
> >
> > This came up in the past, and we have some machinery to check if a
> > commit is part of a series or not, but in practice most of the series w=
e
> > see are actually not ones where patches depend on each other.
>
> I'm not sure I understand. Do you say most of the fixes you apply are
> from single-patch series? Or if the series has multiple patches, how do y=
ou
> decide whether some patch depends on other ones in the series or not?
> Because judging that sometimes requires rather detailed knowledge of the
> involved subsystem...

Well, not always.  If the series is of the "clean up this same thing
all over the place" type, you can easily say that there are no
dependencies between patches in it.

