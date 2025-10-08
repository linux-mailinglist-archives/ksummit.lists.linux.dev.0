Return-Path: <ksummit+bounces-2450-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A00BC6CAA
	for <lists@lfdr.de>; Thu, 09 Oct 2025 00:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E66A74E33C6
	for <lists@lfdr.de>; Wed,  8 Oct 2025 22:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561FF2C158E;
	Wed,  8 Oct 2025 22:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqePRY5O"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6E82652B4
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 22:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759962106; cv=none; b=DC+Mbrej7lwBzR72vZ3SHs9lCD5edSvOBK4iR00ZzYwRDuhevXfCllKlwJjhF0N0RsZEUmvAD6G5r4XNijteywETCKlvMudBVNL0JqKDPtKDdxf1Kj7F1l8E3gSbq6rjqUtJ2B3HrvuPloxjRJ2T9PoO0AnpuJ9FDNh3wLCjBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759962106; c=relaxed/simple;
	bh=onP4ZdRtII5ggrHXXq6muIXcHzkCukW/pIuamJ9UsKw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ENzzGV1KtQkhPrzWIEgebdUToIoq/TmpMg9SKJbaTDMf6MKZYoDdPsJkMSFUeivxSFlGupPWjiyKm0W+79d8e++D22K2ZjhpVhmDt79726u3wK7i16YKVUri+fC5lJKEfce+n8j3D5jN9GWFU+08OlG9uKFG9ffaex7xSmGcLtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqePRY5O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1386FC4CEE7;
	Wed,  8 Oct 2025 22:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759962106;
	bh=onP4ZdRtII5ggrHXXq6muIXcHzkCukW/pIuamJ9UsKw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lqePRY5OE7PjowvIO3p8ZfKU4HCX+mWanf773+cC8RQmgJmZ6C1M68fkb3Z3EcThZ
	 pmP/25A3LfnRUPXp/S1aSt1316vzpbCRB0l6jyYD77TZbSl/3Y8u9jsNz9HYEqJ/4v
	 c6iZDwtsUcDGXGL7okMmUUXbxCXxr4E9y0Rael4+dFBAZvj2SNJ8Tp7Q2Xh9/sQzDO
	 MOvim6AwJMrAzvB7D95kI0ba0rOuy8WKhHx6R0U14vWkuVw7k8fYbhqRyT8g5Lvxt2
	 h5W2ndFenG9uSyikcnhgRXEIPOeuXlfiPiE1XgYcGIdkA4Bc5oC28HHVOcOdP26SM2
	 +a695AMXNI+aw==
Date: Thu, 9 Oct 2025 00:21:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Bird, Tim" <Tim.Bird@sony.com>
cc: James Bottomley <James.Bottomley@HansenPartnership.com>, 
    "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
    Andrew Lunn <andrew@lunn.ch>, Chris Mason <clm@meta.com>, 
    "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, 
    Dan Carpenter <dan.carpenter@linaro.org>, 
    Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: RE: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
In-Reply-To: <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
Message-ID: <71ss7536-3519-1p59-3450-0n399598p644@xreary.bet>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com> <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch> <20251008192934.GH16422@pendragon.ideasonboard.com> <MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com> <MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Oct 2025, Bird, Tim wrote:

> > Realistically, we can't even get some submitters to run checkpatch, so
> > I don't think the additional tag would help. 

Agreed.

> > What does help is having the 0day bot take a feed of the mailing list, 
> > select the [PATCH] tag and run checkpatch.pl as part of the tests, so 
> > someone could do the same with whatever AI acceptance tests are 
> > agreed.
> 
> There's no question that 0day automation of checkpatch.pl feedback
> has been a great thing.  I suspect that more submitters would run
> checkpatch before sending their patches, if failure to do so resulted
> in automatic rejection of the patch.  This is more of a process backbone
> issue than anything else.

Quite often the checkpatch-reported warnings are so negligible/trivial 
that it takes less energy to just (a) either take the patch as-is, or (b) 
modify it before application than to go through the whole resubmission 
round (*), so there is no incentive for the submitter to do better next 
time.

I am not saying what is right or wrong, that's just the way it (sometimes) 
is.

(*) Especially if the patch is actually a good and needed one, and you'd 
    need to keep track whether the resubmission really happened, etc.

Thanks,

-- 
Jiri Kosina
SUSE Labs


