Return-Path: <ksummit+bounces-2433-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832EBC6434
	for <lists@lfdr.de>; Wed, 08 Oct 2025 20:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFB5D19E3DD1
	for <lists@lfdr.de>; Wed,  8 Oct 2025 18:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7212C08CB;
	Wed,  8 Oct 2025 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="U+nZWLqH"
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE922C08D5
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 18:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759947291; cv=none; b=CrQY+oBDkBVqhL27jC6YnRY/78hKw6f4oVoEwI+kctBxnGgZLzurCezOm6E/y61r5OCPwt+08GIQo2fR7zo/XsU4sdtbZnzpG/4LmyQXhzBi0b9O/YVlZgAg4Ss3NQFWJ84x6TXZX7P5XIfDoGrqKMN3R7JrTLZ82mMdFUhb1Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759947291; c=relaxed/simple;
	bh=slOhs1hXlyJxZ0Rgzvz+OwRH8PKWMEgqTyW+l8VUXB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=E6J6/DPEbId+D+pfmPMyYYDrDwQFRLzZdgl0c+bQu+MQPHgIkqelYv/D+YpRETLxKphv7rljadha9kkNV3RGDX0qzZN7ifqia56BUJdehH+0pUgMh5UhhZenNv6xt9+aR4yXNzQRgRemrIlqdoEsBqr1hepg/3sLu6NCGLBP/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=U+nZWLqH; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4chh473NBxzlh3sX;
	Wed,  8 Oct 2025 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1759947286; x=1762539287; bh=slOhs1hXlyJxZ0Rgzvz+OwRH
	8PKWMEgqTyW+l8VUXB4=; b=U+nZWLqHCcPrH3if75x+WxL0ODzvjZWDArrmu4fq
	cjq5n+o7NFJ3h+hYML0S4YPUB5LRNrCvZRRlQg1/7cDR685DsV21oQje5Blopsbu
	jQ3bNzr/ATTAyhka5J5psOb6tKhuGTpl3n3IW9TGEHtJmb26u2DLNvQ8MZzmXXY9
	CmCQRQ0zpXfCd939x7K2kr5LyCGtoDXJYH4h+PLIz4NFsYsZ2SqB1IW+rVUyaQ1+
	MrxnNNVKuQ6zelm38Qc+ihhuS72NYjf5vBYkacevIbndJGFfdVRoFnb64UVSM1/q
	CRLCF7U2FOFq2CJExpTpy3uFB1tAo1mLJcPQ+UiGCgdOow==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id JOFOibTEl1p7; Wed,  8 Oct 2025 18:14:46 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4chh440YcdzlgqV1;
	Wed,  8 Oct 2025 18:14:43 +0000 (UTC)
Message-ID: <adbaa57a-4dc8-4929-b319-8dc96ce08e89@acm.org>
Date: Wed, 8 Oct 2025 11:14:42 -0700
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
 <28cd7001-0a24-4dff-a4c7-714495bff7f0@acm.org>
 <3ffd9164-919e-4fea-8597-601452537331@meta.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <3ffd9164-919e-4fea-8597-601452537331@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/25 11:04 AM, Chris Mason wrote:
> Claude really needs aggressive use of checklists to get it to stay
> focused, other AIs may need other tricks.

Would that be a reason to avoid Claude for code reviews? All I need to
make ChatGPT or Gemini come up with a code review is to tell it that it
should review a kernel patch pretending that it is an experienced kernel
developer and also what issues it should look for. The AI kernel patch
review prompts I have seen from my colleagues are about 30-40 lines
long. However, I do not know what copyright license applies to these
prompts so I cannot share these prompts.

Thanks,

Bart.

