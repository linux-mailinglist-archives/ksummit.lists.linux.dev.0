Return-Path: <ksummit+bounces-2834-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEi4LlLvhWlvIQQAu9opvQ
	(envelope-from <ksummit+bounces-2834-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 06 Feb 2026 14:40:34 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF1FE49D
	for <lists@lfdr.de>; Fri, 06 Feb 2026 14:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A56EB30488C2
	for <lists@lfdr.de>; Fri,  6 Feb 2026 13:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1566E3B52EF;
	Fri,  6 Feb 2026 13:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RhCN/MwS"
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2987D1F9ECB
	for <ksummit@lists.linux.dev>; Fri,  6 Feb 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385095; cv=none; b=cWlHA/1rcs8m7f8KMyD+y6vUUN1H8sttcktpXY7cSUrICQ87ZFBo4QeY7H4KWxeRJMwUDlHQK9k3+/RedhNX5eI3sYbFCmeCz2mTx4KT8p2GPpZ1hvA+C3tEcr0RnVJ93+vwrbzfdikNeP+6COqaAgmmujguZBDQz96Zivy0vCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385095; c=relaxed/simple;
	bh=QtpYn1ngG1pIquTSteEA1Exh0swUCVcvcJ4ErqB34cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txgfR3NB2Yo0OnqOL9D6tGVrPiPWiXlT6sXSe51bFS4nos/2PjOMthHG+q/BLnYrC4gxThqM0K+vhQbdk4DXVZEsFbxGlUgBAahbdqDv6gGhEsE0hpoBe+FpMCKQjRXYfjEW2IJ0HLMF6xZsPZF2YIZElbsJdETJ/+G5k2vnAmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RhCN/MwS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43590777e22so471495f8f.3
        for <ksummit@lists.linux.dev>; Fri, 06 Feb 2026 05:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385093; x=1770989893; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d8pYDbKNA5AQ3P17kRU1z60TuuwN1/YoGwGgawp5G8U=;
        b=RhCN/MwS8ilL2UsHoOx0F7QKd7KPbzyNrtjnx/5hI6KaOof3pHX4XuoieTN1v5IHYq
         6IUj+2IWz2PCKBhI5Kj/G7evf2HaT5R9ypyAzfrCi9w5NjmgLdZDpIWBjgLMmQW+2Ibr
         5XVKdT5wAKvJSlg1pKm+mlojZC+eANZQJ2W/okpnJFQAVs1O2uy3UBh8/UhCtFAh8mZz
         Lt76Vba5Cx4V/HLMM3ddZ40fiPrkYUmsfMUN2tbt6v9xVI2SxK4iWRuy/jYIDQ/caz46
         fsnbrgjU8RBTdBlkyRXfRzvqmBU/MzwhAjam5DgYRGHhW6J46aijuIplbPRfx28yiizY
         dbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385093; x=1770989893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8pYDbKNA5AQ3P17kRU1z60TuuwN1/YoGwGgawp5G8U=;
        b=BTlR/yWP//m6/0MVAMXbBMtToifgb02vDz3LkZ58r9b5e8mR1wZ3QTr8gNzZYLDCkh
         XHTRDXdfJvxh3+PI+fxJiY50f05zR7T4HzAM5L8585UyxRtHSVcCGzaeVtQAY5LDn4vX
         Kjt0BM/Hoh7sdb3GdhM3X02KFjKjAoQDaEk1FaBpw7wtUGDSoKj0M19tzNlhnkHr0un6
         FgoBYNqo9BmAo41crL/N/tOxbjn+FNovvNfJGEEasmrYNedhiLunVgbfW4Jp9w2eQUTt
         x+lIUYy6cdqW9x4Ko7QUWYBAobzpOTHvyorWp1bxjJGdvgeqlL2GpAFexEYPuNXPG9xX
         nahA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ61mdwIbpFAocKU5FJB/487BNTS7oYGXgERBVvwg6TDHk4NDPQ3WSHe+Fzrr7xt3HDb7891ev@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4VYNicVyrXZbUzvNjrWFDOpL51afO06LqhEwWuvxUe1J5o7Dc
	LEbMFQTnIfh5BReUnUUzrxyEFCxPh0UDLx+UykR9O2e1NvdMldvFg4wAbcLO2S50WzCUMG7jdti
	3w0AI
X-Gm-Gg: AZuq6aKgnFUMYouQSEbiJEf2KlzB2VXzUxNdx8GL/BMElCoox55XlT1eYh/cllQuRFT
	NT0s+IXqPNNUo21gNSIRcXqj9349JUMBAs8cDWvXlhkzYj0GmsodSwX6unXvOis0rouMdseWPf9
	rgoJbg63jzL0JDrlqtexPJLL6V8OUL0FN3qrG0+THXlf15emAEeyXnpU/XnuQu47djb2saqhVrZ
	h3Pl87M2y2LNdGD6sP73P0hJ4KQBe3Ev7CZIuPPoCnLSXCqdxEWTuAbBdBA1RJ7NSNEquYEwJDe
	aO5h7aqtFTfgnUtuJoJhOHFKGSMoOA6fpyz3t1PenWB2coEOHOsPNv/Ax5iMCI8a4XC0SUH/Pve
	l9QrJI2jmnpJLPQcBPj1vcQ1ypcKYXD0cRHTepx8jLmDKbxf6nkEwP71Pgw+iY2vkeNE06Mvgiy
	yzWoiIAI4fPKmdBoj8
X-Received: by 2002:a05:6000:613:b0:431:266:d134 with SMTP id ffacd0b85a97d-436293bb199mr4269151f8f.53.1770385093391;
        Fri, 06 Feb 2026 05:38:13 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25casm6269253f8f.4.2026.02.06.05.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:38:12 -0800 (PST)
Date: Fri, 6 Feb 2026 16:38:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: linux-kernel <linux-kernel@vger.kernel.org>, ksummit@lists.linux.dev,
	Bill Fletcher <bill.fletcher@linaro.org>,
	Randy Linnell <randy.linnell@linaro.org>,
	Brad Spengler <brad.spengler@opensrcsec.com>
Cc: vincent.guittot@linaro.org, lina.iyer@linaro.org
Subject: Re: Support needed to continue Smatch work
Message-ID: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
References: <aTaiGSbWZ9DJaGo7@stanley.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTaiGSbWZ9DJaGo7@stanley.mountain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2834-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,ksummit@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,stanley.mountain:mid,linaro.org:email,linaro.org:dkim]
X-Rspamd-Queue-Id: 47FF1FE49D
X-Rspamd-Action: no action

I need to post an update on the current situation with Smatch.

First of all, I want to start by thanking Brad Spengler from grsecurity
who reached out to me on this, offered some funding, and has been
trying to push the Smatch work forward.  It really means a lot to me.

Unfortunately, we haven't been able to raise enough support to continue
my Smatch work.  I have still been filtering zero day bot warnings and
I am a bit worried that people have the impression that I'm reviewing
static checker warnings when I am not.

The situation isn't great.  The zero day bot can't do cross function
analsysis and it only looks at checks with a low false positive rate.
We're missing out on a bunch of bugs.  I'm going to add some of the
those missed warnings to this thread so people have a better picture of
what we're missing.  There are some buffer overflows in there.  A bunch
of off by one bugs.  A missing error code in fork().  And random other
minor things as well.

https://lore.kernel.org/all/caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain/

I am still trying to figure out a way to restart Smatch checking.  The
funding model would be that several companies would support this project
by paying a proportion of my salary.  Part of that goes to reporting
bugs like the ones above and part of that goes to developing Smatch and
writing new checks.  Please, contact
Bill Fletcher <bill.fletcher@linaro.org> if you would like to support
this work.

regards,
dan carpenter


