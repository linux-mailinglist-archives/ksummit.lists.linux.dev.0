Return-Path: <ksummit+bounces-2430-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92581BC6383
	for <lists@lfdr.de>; Wed, 08 Oct 2025 19:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B3A4055E9
	for <lists@lfdr.de>; Wed,  8 Oct 2025 17:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CECD2BFC60;
	Wed,  8 Oct 2025 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="NPLo5Mg6"
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D6221271
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 17:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759946270; cv=none; b=FsSBWVvGBSz6y/4KIvaKWuLmBS4IJLQBkzVCWd1Hvf8+kfnjYsXGkcvOx+WDjjUzeQJ3fjXyKIyK7nuRw0rhM7Pp8Adx0HRf9xW5AsTc0pJXPO61PgB/9r+q3f5/bg33usNFLvuHpA7lCSQESH+AbsvU4lrjxONr8fug+Hilcks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759946270; c=relaxed/simple;
	bh=pMjBdJh/Lys6mKpA9sUo+3Sd5j2ga3JWQAZccC9D7CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ol7RIEFljQAFcCVbQCt79HhB64V3M5l/uGaFtWl4MKDYgwWFwboSyvASghkrdIqIuHLzQ/2/ce9rvKsX8m1e8t6dun4T620tCcEEKPdxyB+a4MSfHDotQHumv3Tf6yRLHXtk8rMzDt/5YFaA8henBq9ytpluTjxVxy8XIEPN7bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=NPLo5Mg6; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4chghW3j02zm0yVD;
	Wed,  8 Oct 2025 17:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1759946266; x=1762538267; bh=4aWR6onrBvWmJaOfOx03ElA0
	zKoyGbPEUnFR6G/WodU=; b=NPLo5Mg6tc/KMqGM+q2celR1nArDJ6SVwtFnt2u4
	c/VnXSCxRZoPrZh7IzF41z2csjtgOOdCcBwtaN8ax0VWHEhukpyg/Jwoz9SZMbTx
	xUDD85QngAooHQdWte1YGUotUyS+AGNGlawsH4VJHEcUGsDivm3fD60M9ZBktUbn
	I8OVnYiCoQCX8x0TN2X7PVoeZzXIIr57TLViDWNy+cg9JhBJVOIY8fNLqt0/k51s
	zaJDOD4cdFkTSlYhAo+aahPR8WEDeOBjm+hZatBmSh57ZiXxp7EVWCQqo8X/o7h5
	S5/1+DelZSiWcCaEYN3LKjI0iQc1TIy1Qw4m/D3tcEcSoQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 2tGCRSSkM_px; Wed,  8 Oct 2025 17:57:46 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4chghR60DYzm0yVF;
	Wed,  8 Oct 2025 17:57:42 +0000 (UTC)
Message-ID: <28cd7001-0a24-4dff-a4c7-714495bff7f0@acm.org>
Date: Wed, 8 Oct 2025 10:57:41 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
To: Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
 Dan Carpenter <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/25 10:04 AM, Chris Mason wrote:
> 2) A code indexing tool with MCP server that Claude can use to find
> functions, types, and call chains more effectively.  This makes it more
> likely Claude can trace complex relationships in the code:

Different kernel developers may prefer different AI systems. As an
example, my employer expects me to use Gemini and I have seen it
producing interesting code reviews. So I would prefer that any AI
code review prompts that are developed for kernel developers support at
least the most widely used AI systems.

Thanks,

Bart.

