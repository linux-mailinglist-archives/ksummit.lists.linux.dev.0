Return-Path: <ksummit+bounces-2465-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F986BC9B0C
	for <lists@lfdr.de>; Thu, 09 Oct 2025 17:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3A0953537E5
	for <lists@lfdr.de>; Thu,  9 Oct 2025 15:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3684B2EC574;
	Thu,  9 Oct 2025 15:06:04 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689F2EC54A
	for <ksummit@lists.linux.dev>; Thu,  9 Oct 2025 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022363; cv=none; b=iSDAeIk1TqvGbsVczx86d73CeGG/P16vWOKqsG5wLOWjGwcMKq5jAFH1yEZ10ZQ9jt/zYWDYSQ0mYiKJ8welKZ+uHr/IYT4z/U5Saf+aY/NoFuv0gX+J4gyYDh3eYURibpUkrXZovNYcn3QwEcdz6Lacch7vrs98mOt9mtTh/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022363; c=relaxed/simple;
	bh=qzU0HvHH6t1ObJdQ3KtkI5h7qGdAzvStHCjmTRyHDMM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OC6bRPS/QWBSHO9ue/nDJT3fvCcYATQz5Ud5uuTzg0+zKminAsPI9V1uW64vTAFfDxVU7cRQIgWInF37JZ7Iev/ELZaWx+0JHPl293ynSdli9r0rhxVw0G2BteI7w2NwxJT5MY6uSWlxQKBsh0EdkQQI0EQlT3P+qwmkwL+IqD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id ADB0C8853F;
	Thu,  9 Oct 2025 15:05:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 825FF20031;
	Thu,  9 Oct 2025 15:05:57 +0000 (UTC)
Date: Thu, 9 Oct 2025 11:05:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Bird, Tim"
 <Tim.Bird@sony.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Chris Mason <clm@meta.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Dan Carpenter
 <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>, Rob
 Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251009110557.5585327a@gandalf.local.home>
In-Reply-To: <d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
	<fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
	<20251008192934.GH16422@pendragon.ideasonboard.com>
	<MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
	<MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<20251009091405.GD12674@pendragon.ideasonboard.com>
	<20251009103019.632db002@gandalf.local.home>
	<d4eabdd0-dcc4-4e58-9217-9a8628f4669c@lunn.ch>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 825FF20031
X-Stat-Signature: y6p4zhw1rh6gwc595jog9x3nn3ecmx7o
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19QnDYwS7FIwjz3vx4tMnNtqKuryxKCPsI=
X-HE-Tag: 1760022357-433535
X-HE-Meta: U2FsdGVkX19K4zwsqr8DfqOO8NQKZljnLKOploXVUnrS1avWpc4FKjP0DdJrSODCNVo88Pq9aLGwH64nD3uV/73eYfa5YfC4EbNaFSCFaZItm/4dz28db/7HbYTBfqaC/piBX4hA6/b2evnPxONeephN38SeiU0EPPRYPipQvIL/+TYAiZhHwR0CbZgYg8732unA6T8gDs12lcxKSfiOYy2Gbu0Mr5SrmIcdXXs92oYs6ocoBV9bBN5Ucu3y3N9e+uPrxmn5kqpJadwXVZMwLzulpKumMy9Jq0BG4S27drZCbAUzRILujFmHpYOsyVvg

On Thu, 9 Oct 2025 16:51:39 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > One way I see this working is to attach it to patchwork. Sending a patch to
> > the BPF mailing list has their patchwork trigger a bunch of tests and it
> > will tell you if it passed or failed. I'm assuming if it failed, it doesn't
> > add it to patchwork and the maintainers will ignore it.  
> 
> Not quite, at least not for netdev, which shares some infrastructure
> with BPF. Patches get ingested into patchwork, and then some time
> later, the CI system will get them from patchwork and run the
> tests. The results are then added to patchwork, both as red/yellow/green
> traffic lights, and clickable links to the test results. Failing tests
> don't automatically cause patchwork to change the status to "Change
> Requested", a human is needed to look at the actual failures and
> decide if the patch should be rejected or not.

Thanks for the clarification. I'm just a submitter to the system and see
the feedback it gives, which looks nice (even though it's mostly irrelevant
to me as I simply Cc the bpf mailing list to let them know what I'm doing
on the tracing side).

-- Steve

