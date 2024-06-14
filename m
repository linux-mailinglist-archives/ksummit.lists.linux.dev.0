Return-Path: <ksummit+bounces-1285-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C737909284
	for <lists@lfdr.de>; Fri, 14 Jun 2024 20:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 325B81F2128F
	for <lists@lfdr.de>; Fri, 14 Jun 2024 18:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3767E19EEDB;
	Fri, 14 Jun 2024 18:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6PXciY/"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31BB19EEDE
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 18:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718390868; cv=none; b=rg20PFkuqJVSVJvowoO2rLvmNF3L3JivjmxPN6q40+rW6kPTqMMEb+BLyBGSLtBsgyiHS+rmKTKWrxs0kO9s9RuMoEOp6Nu1MUtSG50cJPUfcAE5vacr8APp8ISAGolzKhDLCFd93q5mm1gxOAgKY/ORHVlmY6EGRTenZxcIVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718390868; c=relaxed/simple;
	bh=ixZqsymycEzg6t5Ob3NDZquDwHrOIzsyUI0zv38U6U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgocCMMpCqbxpEi934wc3xOfkaasJfRzEHTte/QZ11Mi97woX7UALhISM6hcxmQc0yIrYtL8ktz6rBVtQN6kP3YBDTseZBHBNwptj9jVz1GhB532Nhhm9nAlEBcKSu+UkXXYiSDHtXANDkPg5OdZHX/1VWk/LkcKP1KczgmomVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6PXciY/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD14C2BD10;
	Fri, 14 Jun 2024 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718390868;
	bh=ixZqsymycEzg6t5Ob3NDZquDwHrOIzsyUI0zv38U6U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6PXciY/Jt0FsWhL/pQ246WruTEtBkJ82PGkMYM83NkfRaDdsrkkQlmK5vmSmxBTR
	 ld4cR2SiDgjvg/RHf7vui+UP1xpc5//AJtYZ39HfzSzDm0lkBQnwViOBqmXp6fMsFw
	 nLImRjQLE6n8MfYWBvWlbq40ybaFt3gSxA4i9yqxh0bLH/xIKtRKUXBCy17itaW/OG
	 jA+E8MPiBK+SDmYfu/W/Ag+yuOAD03pWvujZ7VCRjBkJI8cE8guo5Hm6MwGr1FMxQ1
	 HpXQ0R4Nm9fcws9gAXKjyuh8I+x1fDnZkHVqAe26iBVAeV4Gyjq9rDNSbJRP2xsAb4
	 l9qbrOXLfk7Uw==
Date: Fri, 14 Jun 2024 14:47:46 -0400
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <greg@kroah.com>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <ZmyQUqQ5ZFLuR7YX@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
 <ZmruqWDTG2PK-rbu@sashalap>
 <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>
 <2024061305-swimming-politely-30f3@gregkh>
 <78bfcb1f27462d160457b36f302ae4e12083493a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78bfcb1f27462d160457b36f302ae4e12083493a.camel@HansenPartnership.com>

On Thu, Jun 13, 2024 at 11:11:54AM -0400, James Bottomley wrote:
>On Thu, 2024-06-13 at 16:02 +0200, Greg KH wrote:
>> On Thu, Jun 13, 2024 at 09:56:56AM -0400, James Bottomley wrote:
>> > On Thu, 2024-06-13 at 09:06 -0400, Sasha Levin wrote:
>[...]
>> > > Could you provide a concrete example? This shouldn't happen.
>> >
>> > This one has no fixes or cc stable:
>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f1663c91934f664fb850306708094a324c227c
>> >
>> > Yet here it is backported:
>> >
>> > Message-id: 20240603121056.1837607-1-sashal@kernel.org
>> >
>> > (I can't give a lore reference because conveniently it was a
>> > personal cc with no tracked mailing list).
>> >
>> > I picked that one because we discovered a bug with the strlcpy to
>> > strscpy conversions in SCSI which it looks like this backport has.
>>
>> It says, in the commit message:
>>          Stable-dep-of: c3408c4ae041 ("scsi: qla2xxx: Avoid possible
>> run-time warning with long model_num")
>>
>> That is why it was backported.
>
>Well, that still tracks back to a patch which wasn't tagged:
>c3408c4ae041 is actually fixing a bug in 527e9b704c3d which is another
>of the strlcpy to strscpy patches which also has no cc:stable or fixes
>tag:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=527e9b704c3d

Nor was it ever backported to any stable tree... What am I missing?

-- 
Thanks,
Sasha

