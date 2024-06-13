Return-Path: <ksummit+bounces-1256-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2B1907C98
	for <lists@lfdr.de>; Thu, 13 Jun 2024 21:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C724B1C211C7
	for <lists@lfdr.de>; Thu, 13 Jun 2024 19:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5CB14D44F;
	Thu, 13 Jun 2024 19:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDnJV8uB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503914B064
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306873; cv=none; b=kyasJsEkhkwBo1YBUiXC/ToSQlYxK/iLvmuLvDyx/sdPAAIk0+Suhd1mpUgrD7zMsaAHekVz2io/3mTMlJYfMcF8tNCdKFOd4z4TSEZ/wuUar0s1de+0h7myvwmvDKtj7Wu8qMJ3It48ykY39+rmhi3Dkzo9p6MnUP6Gam5jYBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306873; c=relaxed/simple;
	bh=QclpPbFKIZmYvhGYSMdNlOsxKhozbs2GjowMILbYnZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/ydbJSL+9e/DAqmnxjbAuHtpFZny4BaQFmH6/wqDRDT0uz6Rq+EzPC5yoO4oGUgebp6Zzg9YLrmNnUZysQ7sKUYZcbTsshTWb1XTdOR9mwM4PP3uKUjRemxj5dllHG98/3gV4ickxUQtlcmT+JbsCzcmlnNW6Hm2Ps7C6OhVqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDnJV8uB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D2AC32786;
	Thu, 13 Jun 2024 19:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718306872;
	bh=QclpPbFKIZmYvhGYSMdNlOsxKhozbs2GjowMILbYnZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDnJV8uBx/boYwsnMGj+4mMGBs9bNZJFui3OYsRfZnpo72Nd5RhvaouBY8TmBusiB
	 CFMJl9iqjHK7cFe9FCmRN4kvyvUQk40nilfbJ1eObd+lIhofCeJ7Z/z1veCQdzVkiP
	 RM8D0NS9GGcuuDusESZaUK3GueEKL36xkUur1KyQZwY0s42vwlkNqsCjMuFWVK/oqF
	 6/lcIQfXDPHyEYuw2ZNiMWpm0lXg6eN2wvlg2qk9PMJHMCGAgkJfZWguJs8J+Iwefu
	 z3M0FyxtTlBkdgRIxLcqi2hrUovwgk09N9P0ksaUdbx0ajulRgpa+jiDNADCKxU39P
	 gv1OVD3BJtFsg==
Date: Thu, 13 Jun 2024 14:08:06 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <Zms1hkrxf_k9kYBg@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
 <ZmruqWDTG2PK-rbu@sashalap>
 <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>

On Thu, Jun 13, 2024 at 09:56:56AM -0400, James Bottomley wrote:
>On Thu, 2024-06-13 at 09:06 -0400, Sasha Levin wrote:
>> On Thu, Jun 13, 2024 at 07:58:58AM -0400, James Bottomley wrote:
>> > On Thu, 2024-06-13 at 10:42 +0200, Thorsten Leemhuis wrote:
>> > > The scenario shown at the start of the thread illustrates a
>> > > problem I see frequently: commits with a Fixes: tag end up in new
>> > > to stable series releases just days after being mainlined and
>> > > cause regressions -- just like they do in mainline, which just
>> > > was not known yet at the time of backporting. This happens
>> > > extremely often right after merge windows when huge piles of
>> > > changes are backported to the stable trees each cycle shortly
>> > > after -rc1 is out (which even some kernel developers apparently
>> > > are somewhat afraid to test from what I've
>> > > seen).
>> >
>> > I haven't really observed this for curated fixes.  For most
>> > subsystems, patches with Fixes tags that are cc'd to stable tend to
>> > go steadily outside the merge window.  Obviously a few arrive
>> > within it, but usually at roughly the rate they arrive outside it.
>> >
>> > What I observe in the merge window is huge piles of patches go into
>> > stable *without* a cc:stable tag from the autosel machinery (and
>> > quite a few even without fixes: tags).
>>
>> Could you provide a concrete example? This shouldn't happen.
>
>This one has no fixes or cc stable:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f1663c91934f664fb850306708094a324c227c
>
>Yet here it is backported:
>
>Message-id: 20240603121056.1837607-1-sashal@kernel.org
>
>(I can't give a lore reference because conveniently it was a personal
>cc with no tracked mailing list).
>
>I picked that one because we discovered a bug with the strlcpy to
>strscpy conversions in SCSI which it looks like this backport has.

In this case, we picked up the commit because it's a dependency for
527e9b704c3d ("scsi: qla2xxx: Use memcpy() and strlcpy() instead of
strcpy() and strncpy()"), it didn't come in via autosel.

>> > So this does beg a couple of questions:
>> >
>> > Since you have the figures, what's the proportion of regressions
>> > caused by backports to stable without cc:stable tags?
>>
>> This question came up two years ago and we had statistics around
>> this. Autosel patches didn't cause more (actually, it was *less*)
>> regressions than stable tagged ones.
>
>OK, so Thorsten's stats should bear this out then ...

Yup, this is an experiment we started about that time. We've extended
autosel to be about 4 weeks behind where Linus is, and wanted to look at
the statistics some time later to see if it improved anything.

I would note here that even two years ago, autosel commits were slightly
"safer" than stable tagged commits (w.r.t the odds of having a follow-up
commit pointing back with a Fixes: tag.).

>> > Could we fix a lot of this by delaying autosel?  It tends to ramp
>> > up in the merge window when everyone is concentrating on other
>> > things, so any regressions it causes naturally get ignored for a
>> > couple of weeks.
>>
>> autosel is currently delayed about 3-4 weeks, sometimes more.
>
>That's fairly recent then.  When I look at 6.8 autosel began its flood
>pretty much the moment the first SCSI pull request went in to the merge
>window.  Checking 6.9 it seems to be about 10 days after ... has that
>made a difference, or is it too early to tell?

The mails may come in during the merge window, but the commits aren't merged
until after 3-4 weeks after (we just present them for review early). In
the 6.8 case, for example, the first autosel commit went into v6.8.6,
which was released about a month after the merge window closed.

-- 
Thanks,
Sasha

