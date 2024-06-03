Return-Path: <ksummit+bounces-1215-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D417C8D7D38
	for <lists@lfdr.de>; Mon,  3 Jun 2024 10:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A15D1F21BDC
	for <lists@lfdr.de>; Mon,  3 Jun 2024 08:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DB057CBA;
	Mon,  3 Jun 2024 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YjayMXKh"
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C967954BD8
	for <ksummit@lists.linux.dev>; Mon,  3 Jun 2024 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403006; cv=none; b=B/1WLgM/TtulZyttggFJWBcYVc3CJoz7FmTn/XLLbNa3DY8ZhTU1VEoz5zDB6fo87n3ZFZO85vZCOSG/5CO3YZIG7wmkTrOsSHmV+PGKn24guOBA9ue48KJ7yc6rXPrFJ6HJpJJyCohD++9ubxHRet7+9mOOWWumgBKEJKyoT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403006; c=relaxed/simple;
	bh=VNFmjTK5w5iwem8RKQl6PpUJE46bVmRNOci0hECs87s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3JLMFv+ASY2j5Q2ApmnHv8STW7ELCYS6Sn6fmfb46sX1mukb9aVTDQgYHffuxwH/5jy6CjMT1vwPgcuWZOYGV2j4PJBqt5Db2Yc4Bm94keNfcdkC7M6Xv1DUFid6N6Y2mmGkiVQ/u1ZoF5dReSA0rJAjWydbzQxFR1bxSamleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YjayMXKh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso8625411fa.3
        for <ksummit@lists.linux.dev>; Mon, 03 Jun 2024 01:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717403002; x=1718007802; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNFmjTK5w5iwem8RKQl6PpUJE46bVmRNOci0hECs87s=;
        b=YjayMXKh7gKhf6Sks+ZSFVCpHF5JtR7zO18OpZ+5lS91E8Wrx+8ybrWDyFwMoWycpQ
         +L5nbKVnGYQSUuUnDIQExITfb4uuUujin7qBaTFsa9D8Z1QkCR7KW+NbHx+r1oHNHAo/
         b5Ae8VeLn84YE6cl+kfX1j16t/Llw9y9Tkc8ikGDvpl1DC/gs+6S+0UpkDfGb8FsleiT
         oz7W7XCc2RTw61bAD5ZskMzzo2XCutZ+ZGZCUvJdw9g82U5gLrnK1BzAsisQi5RCJjdx
         UIC7j5LbzyglHTejP9EI9OAE8xWZDxALjkrTLPYMUjWTaurovbY0tv2MVKewR3/07YB4
         AVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717403002; x=1718007802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNFmjTK5w5iwem8RKQl6PpUJE46bVmRNOci0hECs87s=;
        b=Tl7jRcQnAZ2NArU0Gtz6Whbsw6HAfUHwix/R4yBNfERRsPo1xYfWMhqCO21wwqv0/r
         4w5Az36qukYE8PORN9gtWU4f4pkKxush+h7bqRMfk26/qcSFzYG4fRUKsuJELI2DtH3V
         Up/Q/rx3pqldBTC/fUINISxGEqyc3FYrVTuXmBjrn7i2+eRsFe27BxQkf9o5ndtCQoxn
         EW5UszNERcdJ2nN9ePtPrdmwJseXq93DlEFa0yWNeUBCsbMgBykfAf0lxA7gaeVprGfs
         2ZN4cMNFhtTE8t3ZQn0D3198fUq10mdXeOJOFXMgi/2KbCwA89+15C1pEtb2+zzAwSlD
         QhHA==
X-Gm-Message-State: AOJu0Yw7RwURFRjRzKLzwjX1/gkmHIi22vYwNq6SmpQU3YdJFhb4b7yX
	YJm+0bwWNSOKmWfwSSFoU++cg7JZUc98JlIokZihZfW1S77M796P87P3G4NtwwG8ur28vN2GY5B
	CyCmM0FGFEV++hI1Cu/6SYz/iFf8NGRNTUNQVsA==
X-Google-Smtp-Source: AGHT+IFxn0HRkzmN+kNkzQexDvJdoNuf3D+rXBc9nHZeN5bzfjb4BccohwYmRU0EzgP+n8cU8VXECZX+Sp+eXDAC9SA=
X-Received: by 2002:a05:651c:d:b0:2e5:8685:8b13 with SMTP id
 38308e7fff4ca-2ea95160358mr50258121fa.25.1717403001819; Mon, 03 Jun 2024
 01:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSeupU_j3bkj8muMrdrYvfnppYdZ4tPvZ+8OQ5A9BpTOWDw@mail.gmail.com>
In-Reply-To: <CACMJSeupU_j3bkj8muMrdrYvfnppYdZ4tPvZ+8OQ5A9BpTOWDw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 3 Jun 2024 10:23:09 +0200
Message-ID: <CACRpkdaRg7zujpfSLu4G_v8Xa73Y7P0Evv86EiBtUzhTCNE6Dg@mail.gmail.com>
Subject: Re: [TECH TOPIC] Introducing the power sequencing subsystem
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javierm@redhat.com>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 5:24=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:

> Here's my submission for the kernel summit track at LPC24.
>
> Note: The power sequencing subsystem has not yet made its way into
> mainline but as there's a lot of time left between when I'm writing
> this and the LPC24 in Vienna I think it should at least make it into
> next by the time of the presentation (there do not seem to be any
> showstopper objections on the mailing list).

I think this is a good in-person discussion topic, because the power
sequence stuff is very debatable and hard to get right, I would include
Ulf Hansson, Javier Martinez Canillas and Doug Anderson (IIRC) in
any such discussion since they already invented the power sequence
code for MMC/SD in 2014 and probably have valuable feedback and
ideas.

> [1] https://lore.kernel.org/netdev/20240528-pwrseq-v8-0-d354d52b763c@lina=
ro.org/

Interesting!

Yours,
Linus Walleij

