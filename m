Return-Path: <ksummit+bounces-2093-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1A7B1C200
	for <lists@lfdr.de>; Wed,  6 Aug 2025 10:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A118B1672F6
	for <lists@lfdr.de>; Wed,  6 Aug 2025 08:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A43A220F33;
	Wed,  6 Aug 2025 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RpvnHbUN"
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4061DC2FB
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754468252; cv=none; b=HOPxw+/j0fvx+Vpdtij/b9nc6Izgng6NMuPOUDRzjCfaw9KttbENE0OOlGbsiZlv/gUQ6wysw1P+wjnC32s3Ec2m3PeR/Z0xW/BIbu5iLHt4rfieZLk9KfSUI7+NmYSfXKa0ege0lsj7SNlViLiGdixMRewudcAf6XOtp2hbVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754468252; c=relaxed/simple;
	bh=kr1iUOzrZJc/JahoNNc16qVrCP9Alm8agtTZGRPSrvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzNS3dWFm6rcxQ2wZ/FZue+QAuI13zakQVP1PLfvhFeyPgWhXqYLhxJtDLv/sJI6g6AUgrYExb3T+F9WsDBb6sDTVS6nHFWxrxIXPwVarRdhrQ6qD//+eLE6WHgvkWbO886WLuEeADPO1iJCwz1ky0j8mWN+gbmametEcH5XrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RpvnHbUN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-455b00339c8so41043365e9.3
        for <ksummit@lists.linux.dev>; Wed, 06 Aug 2025 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754468248; x=1755073048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=liGIrgrIcitCitzYFL2LHLO6Nl+SjCImB0rqepyH3+Q=;
        b=RpvnHbUN9NChFj/Vu4gI96OmoBro+GoS59+wPOnMhi5wln27YxrsGZBfxgZ9Jrzm5V
         8aXZds7x027LJ1EgszlilaUSPcjU0bWm4do7EGK4OMPZ2V5pNT/DPnYoLls0bHdOm5wS
         D698VcX1aH/Ht7acME6liTyBMmthcpBBmAP3F8NeE8KELvco+M5DFUEqUhKCCVp9aX46
         EcA2o7SnXzOq35KqfxHaXwfS3XxOofKkLMEF2p/zcstOX1tNuF5hqPDzMsWzDRjzA4kt
         gXaL7KdYVfPDEzzL0dUoceIfebUMQlbVmrO9LYZhxqby3yqyqbAZEa2Qc3Jy4xujLYni
         5Fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754468248; x=1755073048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liGIrgrIcitCitzYFL2LHLO6Nl+SjCImB0rqepyH3+Q=;
        b=sJw8R/YTd0bH4tg4oSvyJJSGaQFQyR1X8oIG1D+wWNJsAE4jk/u8RgAIlPNMYNqHrP
         ubBYUB8wSjBEbUtprrB0etKlLLi/tKp+jMllOQ4qehzo+UptV1P8me4oNucb2nSkwVEI
         VRanE4xS3s+yJFh5KdjklLzAWdWB94Q4AQ8bBNNVEpRqHzFF69qStF7cGo65l4PSVO3g
         ZJDPD1LsEuKQnSUv5q2RTH7k4u4aGwhEsRNh5csx1lajlAAVdDgqMRJ5GyPZ0fO6oUqO
         99BUmsVRU2xAIPIYm6w2WTEIgt+OxAtFzhJY+lrDQKOdeA9DzFT2M1nuc87qhegADlXM
         XM9Q==
X-Gm-Message-State: AOJu0Yy5G088oiITp/aWEf2g4bxr5nyTmTmailK7zDCEVxzjlx3dmtB+
	x6YUujVG1P13Rl7zqP/vqkaUPQTBXXEmSz//+QC2kzpRsQDhNX3ywg6KqZMJbRiK+i9zL0JM8gW
	H0SEf
X-Gm-Gg: ASbGncvZlDiNCVN34KnRYBLrI3xDtAyzEkGw6zFLLDuDIg5skHrweiOAwRT/17jQv/K
	2SQ5WfPLSzd1BsSDlK8VBELriyK+en+S+eaA8WnM6okRWkNQHvfin4vq4fUEOtms8W7WtBbTssy
	DQ40oLnwUdwp5AD+5BJMsMAwrf5ebgcGN5NGNY9Na08mPXg1ubuXHXhnTssQwqn5g/4w6k1aOuq
	S3X7ZhOS97HEYbD4mruIe420jwSLR+KVhRGzgH/LEdLlRXETM4tCTdsOjelKSSv4O1taRWudLeo
	hADj03vxfhlxWas7whx5embWRqIKXjirv7+7529Yt4mddFwHzH0ak+fMJv/CxwlQ59Rz0H1AGfq
	jpgxd8TyIi9EPiklqsYWBmjkAkDw=
X-Google-Smtp-Source: AGHT+IF6o7VBzWWfPK/UJ5Ov5JCe3EHJSe5Htw1OAyx6Mx7dWecAJewzgbyWbPBxEs5hTkYlV86/oQ==
X-Received: by 2002:a05:600c:4506:b0:456:133f:a02d with SMTP id 5b1f17b1804b1-459e70ef03bmr16476195e9.17.1754468248366;
        Wed, 06 Aug 2025 01:17:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm139655215e9.24.2025.08.06.01.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:17:26 -0700 (PDT)
Date: Wed, 6 Aug 2025 11:17:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Kosina <jkosina@suse.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <e03f2583-c149-4fcf-aadb-81fe40afee46@suswa.mountain>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>

Just a "Patch generated with AI" under the --- cut off line would be
fine.

We had a patch in staging from AI which "copy and pasted" from a spec
that it had hallucinated.  The language in the commit message is so
smooth and confident that it took a re-read to see that it's totally
nonsense.  A lot of the patches in staging are from newbies and
sometimes kids and I believe the person who sent the  AI assisted
patch did it with good intentions.  But, ugh, I don't want to deal
with that.

regards,
dan carpenter


