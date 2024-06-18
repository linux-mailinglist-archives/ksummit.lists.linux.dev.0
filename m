Return-Path: <ksummit+bounces-1314-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB01890D083
	for <lists@lfdr.de>; Tue, 18 Jun 2024 15:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E04C1F226D0
	for <lists@lfdr.de>; Tue, 18 Jun 2024 13:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A59217839F;
	Tue, 18 Jun 2024 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="xHTNgvPb"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D8156898
	for <ksummit@lists.linux.dev>; Tue, 18 Jun 2024 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718715533; cv=none; b=RDFFXE3f82HToakg5hNRYkewROSEsBi4witxOFo+q0dG6/WkwYrn90GXoX3N8gIuKGNrqc5FyXNrwRBX2VpUv4pHicClbzAR7XoimE/33ypYeteWQVviu1Rk/Dch3Nxl/pJAmQ1XmLSfO8ZVZKaBCrP1Quc1u9B7+a6q6xdXRL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718715533; c=relaxed/simple;
	bh=XI7zV3UOYfa7N0W5rtVaJixjQ6qfxljyVaj6cVmOnsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOQdQrxEawU4y8cjEml4JajwXWxdFU0T27jLp38OR3+xfEEc3vfZDvFrym2fZ3rbqoRbco/wfUZRnR+a1wexKtdCibmwpAz+IQv9At822jNtGF39n+2T3UV/dYrPNiSkDu6njez9wVVTmcWTu/UvHPkUWJSiPJShUUfx09QVVhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=xHTNgvPb; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=8dHgqub/HfBiGPqwZtYgnV9a3l6a2YgBX1FZX5RCBBw=; t=1718715532;
	x=1719147532; b=xHTNgvPbvZGs4cyZ8srD76R4FaXFYJM61e5eNX4KorS7gw4prTHAo0T83Xyso
	qhbeIgyY0G+y1MSSk+882MsDhB7tUeS0HMtFgeID/hms+Nu7lMXq1s+mCNEbG+h4oF8956NycWrLv
	4lxG2iOZSKQFQOEl/sJ4x1bNmGdG6Cm30ygKJQC1b8YKFG5b/p2CI0MhwMqCufnwGwr+lFlQRPyem
	pEabw8Fr9Y/iEnnKQLWwgEQo3oy/5PFQda1WkliROB3ZF7dNKLetZxP8Et18NRemEN4rzdCw9jHT7
	semdg5yQbhkN6/KnqrvIdFA7Nbhsfpmedd7Qt1/VEOorlBI3yQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sJYQD-0002wQ-QE; Tue, 18 Jun 2024 14:58:49 +0200
Message-ID: <635e47c6-c2ce-4a5b-9957-6efcdcfe2f00@leemhuis.info>
Date: Tue, 18 Jun 2024 14:58:38 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
To: Mark Brown <broonie@kernel.org>, Jiri Kosina <jikos@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info>
 <20240613113455.GH6019@pendragon.ideasonboard.com>
 <nycvar.YFH.7.76.2406131336450.24940@cbobk.fhfr.pm>
 <ZmxPPH2PSxoryu11@finisterre.sirena.org.uk>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <ZmxPPH2PSxoryu11@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718715532;d120db27;
X-HE-SMSGID: 1sJYQD-0002wQ-QE

On 14.06.24 16:10, Mark Brown wrote:
> On Thu, Jun 13, 2024 at 01:39:00PM +0200, Jiri Kosina wrote:
>> On Thu, 13 Jun 2024, Laurent Pinchart wrote:
> 
>>> I don't think piling pressure will help. What could help is to reduce
>>> pressure on already overloaded maintainers, to give them more time to
>>> handle regressions. There have been multiple discussions about
>>> co-maintainance models over the past few years, and some subsystems are
>>> (slowly) moving forward. I would be more interested in participating in
>>> that effort. 
> 
>> Fully agreed. That's exactly why a few days ago I proposed the topic about 
>> exploring the options of making the merge tree more deep (by delegating 
>> more and making the co-maintainership model more prominent), as that in my 
>> view is the only available solution to the current maintainer pressure 
>> problem.
> 
> In my experience deeper maintainer trees are often a factor in slowing
> down patches, passing things between maintainers often just inherently
> adds delays even if nobody goes on holiday or whatever.  

From what I see from the regressions perspective they are not ideal
either. The slow down is one problem, unless the process is streamlined
well. Another one from my biased point of view seems to be that a few of
are far away from Linus and apparently not fully aware how he wants
regressions to be handled.

Which is not really surprising, as over the years there were quite a few
cases where maintainers of core subsystems were not handled well either.
But sooner or later that resulted in a clash with Linus[1] and from then
on things worked better. For many sub-subsystem something like that
never happened -- and the maintainers of the higher level subsystem can
not have their eyes everywhere, so they do not notice such problems or
are more lax and friendly.

If I notice a regression is not handled well in a sub-subsystem I point
it out (often in private) to the higher level maintainers. But that does
it tedious, does not scale, and delays things. That's one of the reasons
why written guidelines IMHO would be worth it.

Ciao, Thorsten

[1] see the quotes from Linus at the end of
Documentation/process/handling-regressions.rst /
https://docs.kernel.org/process/handling-regressions.html

