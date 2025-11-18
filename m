Return-Path: <ksummit+bounces-2631-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA12BC6B6B3
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D1D94E044D
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA59A2E1730;
	Tue, 18 Nov 2025 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="COwaS2K6"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0807298CC0;
	Tue, 18 Nov 2025 19:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493847; cv=none; b=WlVjPQ+vrhhLQHk7lC4vZlqaBxMbTt/v3T3BgaWKl3gp4+TzT2iV4rkqytF/dlwxjp+8jpPyZHZlDQThtn5Eyb1tTYD1P9YchySIpZw9mzFVexVSQblOEBnMJr97TK/xxb4edQegA3q3Ggrx9k6sUNvvBuh1JkA7cZUNRCPdQSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493847; c=relaxed/simple;
	bh=a1o09cQRS4+IBEZ+WZLQvuy0nO85VHduK7lyu2KcCEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvcS0afWJQMObzzwdQYI8Qt/AsM9ejsFIphgl/+SPezws7hIQpRNwNt2Fa0F2JfORwx2AQWI+Uz1yUMWjT3eyxDMsygjEKQ21sTNen1lJmuiFukzbWZSgMSc26W4r+mDvin8jVcJPsYJ8GZQGLnSPFcm1B2LJ5k9SPwY/jf0IoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=COwaS2K6; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9484:7ccc:663a:75c9:3b5f] ([IPv6:2601:646:8081:9484:7ccc:663a:75c9:3b5f])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5AIJNugm996282
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 18 Nov 2025 11:23:58 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5AIJNugm996282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025102301; t=1763493842;
	bh=u94BFj9aucCnm5djTLdWDpkBqwZaWGNiMv6pQzFqZuw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=COwaS2K6l1ZWZeoQiEGzHQ/LjSCzcggoNTM9Nh8UgCiG1ic0qyH+vsIXymA9Crhk9
	 3aKJKpi5fqG/VCEZV5iKVoGocx6ajqQQpnTWMRNx8zmkYE3A013AsL6AXz9KfOWRPP
	 xzrmN2uCFtKa/iWog5Jk5k0lCx4jK2r5q6jeBpgT+5JSzR72ZbGnP9hHP0fmB/CsvJ
	 HWQ4ddnMYLJfGJbzzdkuzrhJ4jeiXekvkoWfC+zGFFIF0v9u1c7nJ1Nw/YSoIPCux3
	 JlKngNw3aoqizcXqhFAFL+3KKuvbz67KTkoq7gq9/IOmgJwsqzf/BZnklGTRRbChfc
	 R7Ex9OMz5XGSA==
Message-ID: <cd6f099c-c28c-4b69-85f7-6012139fd646@zytor.com>
Date: Tue, 18 Nov 2025 11:23:51 -0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-11-18 08:39, James Bottomley wrote:
> 
> For myself I do find some value in the C89 declarations at the
> beginning of the block for readability, so I'm happy to relax the
> mixing rule to cases where it's strictly necessary and require
> documenting in the comment what the necessity is.  However, I do think
> we should, absent ordering problems, keep __free variables
> uninitialised and at the top of the block given we can detect any
> problem (and thus keep this rule absolutely for non-__free variables
> where there's no ordering issues).  But, again, I'm less attached to
> this position than I am to the consistency one: I really think it's a
> bad idea to change the rules for one class of variables but not for
> another, so whatever we do, we should do it for everything and if that
> means relaxing the rule mixing code and declarations for everthing, I
> can live with that.
> 

To me, a major win with pushing declarations down to first initialization or
thereabouts is that it implicitly reduces the scope of a variable (without
needing to create new blocks.)  This can sometimes catch some pretty serious
errors.

	-hpa


