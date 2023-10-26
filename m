Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF37D7B7D
	for <lists@lfdr.de>; Thu, 26 Oct 2023 06:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB64281E4A
	for <lists@lfdr.de>; Thu, 26 Oct 2023 04:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB0BBE7E;
	Thu, 26 Oct 2023 04:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVC+H+T7"
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE3123AE
	for <ksummit@lists.linux.dev>; Thu, 26 Oct 2023 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40839652b97so3334505e9.3
        for <ksummit@lists.linux.dev>; Wed, 25 Oct 2023 21:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698294556; x=1698899356; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMx657uezOJ5kmCTgoeA4HCR7tZ3spvjRGAv0FLPlKw=;
        b=FVC+H+T7N+RgO06dkxn0qk4RWGlj2dksFVYSYywR4q5OlPaDddZgeTAjn2kp6n38dZ
         7nmxwIaHrd8d4LMzxhrwhijZw65ot3RpV037J0Dmo+ue0V3WLTN5RyycJRepRQuIKi3O
         bL2/vNHJokCdI4vDAD56Ab/LJy9Ff/ROKe4d3xBMHeqTyGwiR6AftDAKJGuF36fiWKAO
         J7NqJvc/oze2MUUp7eQ6Y/sBI/hNCaLOalngP/Rf2oryv1vtCji9kQ1IwmStAzhNn8Ts
         Fwwq+ruqpYKRnK5B+H352ZN/G4BghTwZJ5uS06XhdK4hMxdvcrJK9e683SBQK1uJOjRz
         Qzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698294556; x=1698899356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMx657uezOJ5kmCTgoeA4HCR7tZ3spvjRGAv0FLPlKw=;
        b=B8yCTkSU8WZOiTlauEMb0oXKJKv+oiQJ92BpbW+mtvvhq3Bly99SPCGSMMB3zPtw0T
         kd0AZEhlhooBEx16qlH0OsoYQzMeB7P9JhMbbIUfmmsWnMnndCygo4sVKF4adSylvstd
         2BAJEzas4u3VuKKtE0c0c2KrNZLJp8lrGXnDNASGIwl/8fZ5w3SQKai0EDUzySGrsUf/
         AbYDoUUbUd+4XBcxmI9uIHjLv68wZTOvKJukZds0mXm1H0xb8A4jTZUq0rUFtW63yMaz
         5HI4CxKuRd1+JXN9OPKdHWxOuA9WM7FHMp+O/9gRDOK+60r+Z9uoImjCHC0sdBgZ+LZk
         Z3PA==
X-Gm-Message-State: AOJu0YwdlL7Ke0bB5YT6fNn9N8yXGFt0k2833FIyrPczd/u5ZDJefLF0
	9OVKpd0FKCU2K7M60l8ZTMKjCg==
X-Google-Smtp-Source: AGHT+IFtEu9JZd5Mj+phH40fmg2CCAygbMyK5FuzrXPcDZ5lzRVQggILIz8W6yil4r/Yml9tjv8P0w==
X-Received: by 2002:a05:600c:3b90:b0:408:37aa:4766 with SMTP id n16-20020a05600c3b9000b0040837aa4766mr13041643wms.5.1698294556619;
        Wed, 25 Oct 2023 21:29:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c220600b00407b93d8085sm1363441wml.27.2023.10.25.21.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 21:29:16 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:29:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: NeilBrown <neilb@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, ksummit@lists.linux.dev,
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <092891b2-b1cb-4b95-bb6b-65e538378d99@kadam.mountain>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
 <169826846576.20306.981035382886610843@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169826846576.20306.981035382886610843@noble.neil.brown.name>

On Thu, Oct 26, 2023 at 08:14:25AM +1100, NeilBrown wrote:
> On Wed, 25 Oct 2023, Geert Uytterhoeven wrote:
> > 
> > Please compare the numbers:
> >   1. 1 sender removes irrelevant parts,
> >   2. N receivers skip irrelevant parts.
> 
> That is one way to look at the numbers.
> Another is:
> 
>   12 - fix about a dozen MUAs to summaries quotes properly
>   12000 - fix an unknownable number of people to quote just exactly the
>           amount that their particular audience is going to want
> 
> and when it comes to fixing-code versus fixing-people, I know which this
> community is better at.

We've historically been successful at enforcing LKML etiquette rules on
everyone.  This is just another rule to not quote the entire email when
you're replying to a patch.

If you're just adding a Reviewed-by tag then post some context but not
more than a page.

For a new driver, what I sometimes to is put a summary at the top.
"Thanks.  The only real bug is some missing error codes in probe.  I had
some other style nits as well.  See below for all the details."  I
normally write the email first and then chop out the "no comment"
functions at the end.  (Sometimes I chop out the no comment functions
at the begining and then I have to start over when I change my mind).

regards,
dan carpenter


