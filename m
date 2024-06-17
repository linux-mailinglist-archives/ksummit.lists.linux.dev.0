Return-Path: <ksummit+bounces-1306-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A845690B522
	for <lists@lfdr.de>; Mon, 17 Jun 2024 17:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5159428548F
	for <lists@lfdr.de>; Mon, 17 Jun 2024 15:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42BA15B98A;
	Mon, 17 Jun 2024 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSFw2GYO"
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F34215B96D
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637792; cv=none; b=I14ZxbDhPfRvLy6H+a17qO7eSUWwyEhvclr7/p4sw5tIz+tTpp27Z0gztT6ZFaGVaXt709BzRK48kNuMloL83U9ysln17KoBrUJVA1/4U6VNyljpmrKaiK758L0zgXenRS1GekE4NauHYC2sZsSx+iFLXOfcaIKW0MfgCwOtFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637792; c=relaxed/simple;
	bh=wk4gU+t5oMkJv+pX+lSHOg0htg4oCzzPhL7NJe76jzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrVthoXjadstdFFM3ndz7i+xnYos09dzx/d8DIwmPxj9NjnLy2HvcPjm1Gjc/0zPEiwDkddNkTgvPOzjZYo5P1zxBowzQjMRaOkgnPrPCaUCo1bDR//ApoS6UJ1E9MBx3rfu9KQvG41YzwmfauR3SLvPkNQVOcGdGQtqqmE92uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSFw2GYO; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so53733611fa.1
        for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718637789; x=1719242589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fn86Wf4rSZMFNiiWs1JRNj6oKXQIBJ4z4CX4mMPF8e4=;
        b=HSFw2GYOytuTxagexlWOAMoWJwFS5+qAtLOs/JvdzDbZd51SzH6pPvPzLxBgfN7Dzi
         qeFmKqB+m6fJfDstOJoJWZsTxTwLr673CVc4PD5AjHFgsTJIQoc4dnqyZVD03pNPbBoV
         3xA96r4kFLv/XBq2QgtidJf/W4V2vaACjfDvwCjPzj5KH0vUxe93mNw1lg7U7p9j7vGY
         j8LtaWNdfiKz8jYamqI1LUEXU1aWklese7pSZAJOuWLsZy1H71cDCevDG3nTfqa7nDsq
         racwkzeo/5PLGndIyzRFp15zfSZm/hhuTevgyqGxlRa0To2V/iXptSHVGwom/pEQzYLu
         W5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718637789; x=1719242589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fn86Wf4rSZMFNiiWs1JRNj6oKXQIBJ4z4CX4mMPF8e4=;
        b=gg7ceEkWxV40wf7IF+UMEJjHuuUPr7ojUEFmhxmbQExbTkDatKkIwJNGpw1uyQXurw
         8I5M1ib4HAgi2D2JAoG6IcXnbNfeuHxshqSOhxbo6wirHepyEJIBz9Ua4tDnYC4Qo6xc
         jHFUiueDp1OSewr0SNU9BKwC06glZqFrNh9VBLLzC8ZwOZAt32v5Itvg+2pnG4RBnTQj
         8OzDWAjONYM+Y1iaP4aoHiAANY1vyhyHuUYMbW8nJz8g2pMKumH4imvRfBWy3oHIoe1n
         ygGl/8To0UWFfeN+utsngePE90qQcXF6ZOrLueMyRYfClFIHyXk/7vzMdRLvlNz+2jVy
         qo6w==
X-Forwarded-Encrypted: i=1; AJvYcCUiVbwbVnfGsCX5iwvqp2QUzSGWc4K6ar579Rgzwq/JkFBAUMnzHkwsXaFOxeq561BH0giiBoH+gPPeb5G6H5amZZ/3DmjVYg==
X-Gm-Message-State: AOJu0Yx5i6kA42gB4mFEnIoZqntXK/WRgGBEbMzJ2a+x52UiQBc7kllb
	rvBNCIUhXOZt6dKKHmc+3sqnr6VJ+OH0pZdLLiDhlxMdnwDzTZZUSlUz6AaXTE8=
X-Google-Smtp-Source: AGHT+IET+CgvPF+WAsp+SA+YF20VPf1KRFmmGAsikNzXby739u6oCWQa5sB4z1poIbYAwpyW8gV2nw==
X-Received: by 2002:a2e:a791:0:b0:2ec:1682:b4dc with SMTP id 38308e7fff4ca-2ec1682bceemr73602791fa.10.1718637788406;
        Mon, 17 Jun 2024 08:23:08 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de646sm201637365e9.35.2024.06.17.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:23:07 -0700 (PDT)
Date: Mon, 17 Jun 2024 18:23:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai <tiwai@suse.de>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <c6f359c3-e21b-4acf-8d70-7ca3eb02712c@moroto.mountain>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
 <f0850566-2fcd-4ce1-ac8e-a41ae70545ca@moroto.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0850566-2fcd-4ce1-ac8e-a41ae70545ca@moroto.mountain>

On Mon, Jun 17, 2024 at 04:48:03PM +0300, Dan Carpenter wrote:
> I guess if we have multiple Link: tags then probably the last one is
> going to be the link to the thread.  So that could work...

Hm...  It doesn't really work.  :/  The very first email I looked at had
one link tag which pointed to the v1 version of the patch and we applied
the v3 version.  I guess the Link tag was intended to have been below
the --- cut off line in this case.

The email was from two months ago.  If I searched by the function name,
then it was the result 44.  If I searched by the author it was result
113.  Searching through lore is not fun at all.

regards,
dan carpenter

