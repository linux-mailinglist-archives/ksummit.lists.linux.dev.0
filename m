Return-Path: <ksummit+bounces-1428-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1915931AD4
	for <lists@lfdr.de>; Mon, 15 Jul 2024 21:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97C541F22AB1
	for <lists@lfdr.de>; Mon, 15 Jul 2024 19:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F19139584;
	Mon, 15 Jul 2024 19:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="niBup8zv";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="P/rtd/C2"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD717132492
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 19:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721071486; cv=none; b=ayEBTUyWwpBmaXX3Vep1kKLqDRSOyEpo1ICJltjkc8FnSVRfFGuUKBMxBnMNSZ2cueFju3uJgrroPA6zkadsAZbMgM8tpdW6T41SryT3xjcP/lbPZiwMDtezP9T1qsS3YdY1ONsJDt2n4hMlIfXKcLrxa4gnzeF5BPiyyPSOqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721071486; c=relaxed/simple;
	bh=8bDBYZTjubmcRbgBTbnICnzmqEI6G865S2SgQgiE1tk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MFy1Op9qvdi01nuVYUxrPQFV2ZbZ2nFeyWKBVxEKycJQgi7OkJqvVXsac2oSLRmxJUidRPxlIi3ewYGOaA5A5fKiQxVAvSmKZmTZ1rBLqAkzGsc12ofwcjrAjsHcWzyXg4WQx405iN+s+Y1liTzkFOV9LEzchkntd86mt/HN2Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=niBup8zv; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=P/rtd/C2; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721071484;
	bh=8bDBYZTjubmcRbgBTbnICnzmqEI6G865S2SgQgiE1tk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=niBup8zvIuF+VaqvWnHogZMgYjSuhbClFNUXQF0d2xoPNLZw4gRvrPQRHpLn8DNZ1
	 vGnav/vZfnLJitxPpmtWvO+d4eH/djM3J2mJd68DqLEq2EY7zsHDO0p7IgGHB4KPDz
	 cFNxOhonjvgRpmQvcmE3n6R57nLIuiWP6pCDKPho=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 01E871286849;
	Mon, 15 Jul 2024 15:24:44 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id ZBAoVPrF0iln; Mon, 15 Jul 2024 15:24:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721071483;
	bh=8bDBYZTjubmcRbgBTbnICnzmqEI6G865S2SgQgiE1tk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=P/rtd/C2CLRLsuVd1dxtSSy0ljIk4rrzdQe+sIZrdeqXL90vM0q1z6IP5qv0odppo
	 ypXs5DtptryHS7NUVkZgYiyv6FKNmf9HFVuuuw0xAzKcpjolWved8U68/0ylN1pbtY
	 LrzXHpeeZmS+xPrpnwFZ2rj67ZrwiUhIiDHk+O44=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4B2A612867BE;
	Mon, 15 Jul 2024 15:24:43 -0400 (EDT)
Message-ID: <2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Theodore Ts'o <tytso@mit.edu>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev, Greg KH
	 <gregkh@linuxfoundation.org>
Date: Mon, 15 Jul 2024 15:24:42 -0400
In-Reply-To: <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
	 <ZpQbQa-_8GkoiPhE@sashalap>
	 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
	 <ZpQyeLFJY1gJvRRA@sashalap> <20240715180000.GC70013@mit.edu>
	 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2024-07-15 at 14:06 -0500, Dan Carpenter wrote:
[...]
> The one question I have is for patches which pre-date git.  I was
> told to leave the Fixes tag off in that case, but I think that's out
> of date. It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-
> rc2")".

Actually, we have a history tree (based on Bitkeeper) that goes back
before that:

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/

So I'd tag these as

Fixes: 3bc0a5f5c1 (history "ext3: reservation info cleanup")

Regards,

James


