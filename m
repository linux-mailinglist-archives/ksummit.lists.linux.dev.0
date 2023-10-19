Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 357037D00AB
	for <lists@lfdr.de>; Thu, 19 Oct 2023 19:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 671AE1C20F63
	for <lists@lfdr.de>; Thu, 19 Oct 2023 17:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC983339BF;
	Thu, 19 Oct 2023 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b/YKU7ZK"
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235338DD3
	for <ksummit@lists.linux.dev>; Thu, 19 Oct 2023 17:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40806e4106dso6809545e9.1
        for <ksummit@lists.linux.dev>; Thu, 19 Oct 2023 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697736891; x=1698341691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLCxd63nCOoQDWmzUIR4g0SFuc5MG7HB5mEucEhNs6I=;
        b=b/YKU7ZKcOIHbAjnmLb66NuwtwAgtSW9D2/Ia0q3QgPRtaYEjey7AztgQdEAgNWzbM
         a8RX1Bclgwk8VMarrAGyfzRfw1TY5u8BlPgV7gYZJTUpzKnAkCLRm2Uu1TXQA3bnNHnL
         cFhDd+2VgkTu6v9EbLjMbkGKU3Z9fdcOY+re9FKbw6f10RRIbQXRlM0E1xtqsbeUI1Qz
         8yWN1etfjK9QiyWL36SJ14kpjWLxg0wRwsEBQbbwvwiX1VATNBzU4EBAXRNTBQKrqONf
         vFAtqaxLqorBd66jBe/IMZIgnB/MHa/MrFyZcjZ6pwn8iRKDd35fmQcmwltNM5NdcFpK
         EKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697736891; x=1698341691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLCxd63nCOoQDWmzUIR4g0SFuc5MG7HB5mEucEhNs6I=;
        b=QgsvEq0Yg/H8EyIAU/skU01VYUoBoxV0OFV1Y2We/6XGULvSEauzqai1CrQNAw+/Tw
         RHbZ+Y/z8xbAMCkhRtuuWu5nu82xydtZ8J7PDWI1FDRz4McNtP51pyVCgEa0lTmxq7tw
         sZDJhUCwbXn1sjmNX2mdHnNzKTBPv9eThiMR2Xz/79odG+e5sUmUfiByyudWTxZddEVF
         umGNC9ZgNt/yxel8V17e7vHRTDLwKl9eGOl3I8YJZZd6a7VQsXT5AppGsNFb3MF120MM
         /k0QmDBGbdW/pa0UNbLIYr47D0IA1JQ1qDkWA2QndhykMAJ754jIgfAdvC7S0TptPn3P
         c73Q==
X-Gm-Message-State: AOJu0YwOT8I105+vEs+FRjy5vNfm+6HJBJxNlhonzgXjhURMw3LOwuET
	YYmXs1G7pGbSF0rTPcWXuVSzmA==
X-Google-Smtp-Source: AGHT+IEtCHGtsgPtZryuWJgCnIKvYEEuVuPw+MYPqy/qvDB4IAGICpg4n4wvIqvZY80GOywc2Mt/jQ==
X-Received: by 2002:a05:600c:5101:b0:403:aced:f7f4 with SMTP id o1-20020a05600c510100b00403acedf7f4mr2625799wms.12.1697736890746;
        Thu, 19 Oct 2023 10:34:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b24-20020a05600c06d800b004064e3b94afsm4910004wmn.4.2023.10.19.10.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 10:34:50 -0700 (PDT)
Date: Thu, 19 Oct 2023 20:34:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: KTODO automated TODO lists
Message-ID: <087316aa-f8af-4612-b035-bada418f4e56@kadam.mountain>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
 <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
 <BYAPR13MB2503AD4559012411E72E0208FDD4A@BYAPR13MB2503.namprd13.prod.outlook.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR13MB2503AD4559012411E72E0208FDD4A@BYAPR13MB2503.namprd13.prod.outlook.com>

On Thu, Oct 19, 2023 at 04:30:34PM +0000, Bird, Tim wrote:
> > And if people use appropriate Closes: tags, someone can write a tool
> > to only list non-closed items.
> 
> Wouldn't you remove the "KTODO:" and alter the comment (or remove it), with
> the commit that closed the issue?  It seems like leaving the KTODO would
> be a bug, as it no longer applies and would be confusing.

No, it's not a comment.  It's just an email to the list when you think
of something so you add a KTODO in the email.  It's like a searchable
hashtag, except it's a one line summary.

regards,
dan carpenter

