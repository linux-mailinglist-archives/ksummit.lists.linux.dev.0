Return-Path: <ksummit+bounces-2624-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CD2C6B629
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 85F67291FB
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D42E2E62C6;
	Tue, 18 Nov 2025 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="pYodApqe"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFD22DF134;
	Tue, 18 Nov 2025 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493103; cv=none; b=Av1xJjnfQ0rtlxGHFOVSzPImahHiZAxBUNU5n8tbjjDFB1ATHiU0kX4Qu9f3l0URBEsk2nvw6y7yAP+liISUZO6V/X2IIncqesJAGGdhxgJVCGw+Ziqs8T0PLxpTVyk+h98YemdkyJ+h5M7UOq7Jcmu6PSezga2zn1lKknxtl18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493103; c=relaxed/simple;
	bh=wmt2ufpsSU3ouyeaDMQzjmquVyGx8emmZiWQD0l4Yrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8PKBpYbvCN52/NxfI/cEJ//PrCioafq2sqPTecEjJkqnzvPdhinX7DJjBAnWte+Gg/oW381W9OAzW7fkgnn1LjaUn9PFvmbJLsN3k2bAOasH33iwPQP25KVglITn2eRhfeWreZ6olkn6qW7P3zj8CaH4V6rGe8nsg2A/ZU/Kx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=pYodApqe; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9484:7ccc:663a:75c9:3b5f] ([IPv6:2601:646:8081:9484:7ccc:663a:75c9:3b5f])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5AIJBE9T989824
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 18 Nov 2025 11:11:17 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5AIJBE9T989824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025102301; t=1763493082;
	bh=3omHpCluL+9JXWDs65PxMcE9qeJS+kGriI7Y0AjSgG0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pYodApqeTJxTlGe88vHjRj+RQbiqeZg+gv5WXWqNQ2ckP0oJzaJubjsCKmjZapDCy
	 fLl0s157XptGX6Xj7brJcAmMTJkXhle57352FsysZILkxnrIW4rOxxR9qv0CWTZzkG
	 d1rPNmwHR+FZLTAsD84p7hKmORrFLdmeSmpnLi6q2exL2BdYv5KpqWc79cHWul5nuO
	 /9CdU8bkj7SnIXgJkNZOubdc2UksBn1wJ9BRu27dSxL45hIQbkR0Htjo1OBzZXEqNr
	 rgRUVfxXAOUaaSKvLLZK97LntUq75txLd5yG3/8CNgvq/QuDIAg83aEHmxjhH7AK8x
	 GIWunIFGrQb9g==
Message-ID: <f895328e-43f3-426b-ab2b-ee750edab324@zytor.com>
Date: Tue, 18 Nov 2025 11:11:09 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Bart Van Assche <bvanassche@acm.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
 <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-11-18 10:38, Linus Torvalds wrote:
> 
> Now, we currently don't use __auto_type very much outside of macros
> (and there we often use "typeof(x)" instead for historical compiler
> reasons), but I suspect we probably should.  There's a patch floating
> around that makes it more convenient with a
> 
>    #define auto __auto_type
> 
> because the historical C 'auto' keyword has been so completely and
> utterly useless.
> 

Indeed, and this matches C++ and C23.

The only thing about it was that it got to be fuzzy the best way to upstream it.

Do you want me to send you the patchset during the merge window?

	-hpa


