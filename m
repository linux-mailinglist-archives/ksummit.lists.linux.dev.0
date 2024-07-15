Return-Path: <ksummit+bounces-1431-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15434931B1F
	for <lists@lfdr.de>; Mon, 15 Jul 2024 21:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 706E728332B
	for <lists@lfdr.de>; Mon, 15 Jul 2024 19:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4533A139584;
	Mon, 15 Jul 2024 19:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kt0badWk"
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C3C6E61B
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 19:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721072405; cv=none; b=BovFu0eBoltvBCelKKzfk+W8sVmrhRDm9tpSfzy/UPpoqXQhmwCcs13ejCbrI4Hd1eoLZhZtDcM5pSg8L81tAak2BRxPnSl6FSzh3Np+855FYlFkHBmt+flzytzIj4AaSmlmlxJ+S6ML4JhYTh2Z7ynfB3Izd7S0sup3RPF35TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721072405; c=relaxed/simple;
	bh=MRz+uvUldlzRtt+uPX1Rjp1OTfT6hklmZlY5iw0Gnns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwjtIIi/OBw2rAYTSUZTrTzWYueQNyj6lx8Se9EH4A2dIStJUGvOcyaRgljKcqIZACFkot+ErLv1ZVcmxuMGl8niA/1rT0yMOr16IX5NnHb/kRoJ9rwM6N1aL2qPdwlXRU0V4h5ZRb4rXA158Oelm/rNBW/rBCLbX8OAcjdQ9g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kt0badWk; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c9cc681ee4so2643983b6e.0
        for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 12:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721072402; x=1721677202; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dhGs2kqJRI8BilLVKc8xaGk46qVIcQYkio2IRIBj0X8=;
        b=Kt0badWkPgv4gJ4r/p4mEapP2xck5E7RksibAemyNUqKMfuWeV6JiCE2XBYUxHhh4b
         S+TgRPgS3S5ay+EbYBI8iUdfowdJ7JBrDmHrHmRrflwH2govrm1HTfSj4lKDXZPK1Brr
         Fct52T3I5S2a48Rs8w4ovPOYKOa3NkOqOGjadCBv6FNdi/iQgEZULHUQ7E6YyNwVRni1
         23+MOUgUA5vmylsI21vWsWU+Zo/Bm/FPFMEdhiKgNBCxj5FoJgl61gRd97rzv+4tZdkA
         cZ9bsLENnZTLlJxQioZVXbIBrM4E0cUjVDD2GLqNVfRh5qFHwcuGnVVIZEKupstCeRxy
         gYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721072402; x=1721677202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhGs2kqJRI8BilLVKc8xaGk46qVIcQYkio2IRIBj0X8=;
        b=KpnY4cCHf/8+rZLFqKGSGkI9pRuX0y8KND4suTyneV1eP3xWjcsN1Qf89fIK4pZLJv
         qsy4FyZY08HDxOHohQM6XxeAU/wpPhjS+fQ9zOwON5hTdeYwW9yxL9w7Lc5bbCnCpzIZ
         o/kaCzZ73yW/RaY0UIMICLZx3BgpfAxFcSef2+2/RBrBKUX01gUueRMqHrFqU/PsZcXZ
         YllApbvRWfdMhLbPnOg2uOoNhtY14I8vpg8Zle/MBkN+UljLtsA2MTe+EF879QYeyees
         wxmBscoc1dUEblklAY8dDae/uZBPT6lZmfYzWaTzhz/W1bu05gNSuzqzymbppLjA04wB
         qdQw==
X-Forwarded-Encrypted: i=1; AJvYcCX9N6dhW/oN9jsTUjweV4ncGVv+AQdM79Fgn7cdgQi/8xvCrm5EiWM+uhTkO8PrmLVlWH8e3sMgM/ErH/5hCVdxsRkutGpOgQ==
X-Gm-Message-State: AOJu0YyDPP26uWzFIzIVRECkm3vpOnvsnlwP4e8ZICTHGhWRtpPPWNwf
	Z06CNb/N1KkokZmJR7X+Al9nZz83PsFrkAmN8JOLfDSHGCPCETCJSbBQ1IvS5NO9lR7P8TTAXD3
	1
X-Google-Smtp-Source: AGHT+IHdW3abXNCpRfLDv2tOZRJp9uCpYWry5ncYfqxyqmARX3JI0NlWu9nCUqXsLBx68BB6RwtwjQ==
X-Received: by 2002:a05:6870:3125:b0:254:94a4:35d2 with SMTP id 586e51a60fabf-25eaec17aaemr17262254fac.45.1721072402294;
        Mon, 15 Jul 2024 12:40:02 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:358f:3413:c118:4021])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260752a9edasm1055049fac.35.2024.07.15.12.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:40:01 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:39:59 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <958a9ad7-6758-4f3f-807a-e44972b5ef95@suswa.mountain>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
 <2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d787d2e12b336f94afe5549cbfef4e1e20d9a7f.camel@HansenPartnership.com>

On Mon, Jul 15, 2024 at 03:24:42PM -0400, James Bottomley wrote:
> On Mon, 2024-07-15 at 14:06 -0500, Dan Carpenter wrote:
> [...]
> > The one question I have is for patches which pre-date git.  I was
> > told to leave the Fixes tag off in that case, but I think that's out
> > of date. It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-
> > rc2")".
> 
> Actually, we have a history tree (based on Bitkeeper) that goes back
> before that:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/
> 
> So I'd tag these as
> 
> Fixes: 3bc0a5f5c1 (history "ext3: reservation info cleanup")

I don't think most people have the ancient history so would just confuse
people and break scripts.

regards,
dan carpenter


