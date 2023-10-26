Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE87D7D1D
	for <lists@lfdr.de>; Thu, 26 Oct 2023 08:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 082CA281EF3
	for <lists@lfdr.de>; Thu, 26 Oct 2023 06:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6EFBE7C;
	Thu, 26 Oct 2023 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0376469D;
	Thu, 26 Oct 2023 06:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59b5484fbe6so4212077b3.1;
        Wed, 25 Oct 2023 23:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698303426; x=1698908226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yo7zQMiibvOrcCe18s7h6tSUNvqWnESk/8F8k/znQpo=;
        b=Ehf+AD+lP0KhibYT/kqDfeHjGSsfVWEIYHNXJcHhmSY77qTGypma2bNS3D2TxGcE5y
         jT49fFSZTeEa40l8TAZkvYTOMSL17dRUKgyX4Pf5d5CIwQgMMg1+jzvNFsJ24IMb8kx/
         +QNVEY2qP3XFV8EI3KUtoXg+aqnKQlK4haqP7PmLF1kSg+sGWl6Wy9kKSWmViAIiFDFq
         iKp7oFkGwvYtYmj5gnV/yqgtINS6c2ZAnu3icTTtPpMdeKO6ouxKbOtALLX4w9A0tc27
         fWPSZQWeMr8ZlasrYNS4APmt0NGkG0bY6dl4YbiuH/f6cAF7nuUdM+vH67tC/BYXmkAX
         lORA==
X-Gm-Message-State: AOJu0YyQxAzVvC67dIXVmgrkK1P0aDD1YYFjy7fVr66aKlNRub8s0G96
	euaj0m50uT73RVwxRJ6hSYNzMRUva2AnZA==
X-Google-Smtp-Source: AGHT+IGA0mRddij/4E2F8MqTFmZAI7VUMYSMiCwYKjLfVztlmUCztlyCGGQG3JLFilPidCdg6/MF1A==
X-Received: by 2002:a05:690c:387:b0:5a8:5ce9:d740 with SMTP id bh7-20020a05690c038700b005a85ce9d740mr20473423ywb.33.1698303426474;
        Wed, 25 Oct 2023 23:57:06 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id x79-20020a0dd552000000b005a7be2919a1sm5802414ywd.14.2023.10.25.23.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 23:57:05 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d9ac9573274so402144276.0;
        Wed, 25 Oct 2023 23:57:05 -0700 (PDT)
X-Received: by 2002:a25:9e0a:0:b0:da0:365c:ff67 with SMTP id
 m10-20020a259e0a000000b00da0365cff67mr7888761ybq.12.1698303425727; Wed, 25
 Oct 2023 23:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org> <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <CAMuHMdXaSv3w0iAJBZ_8PrjMV=A2neZ0a72XbqftxrYVJyCzsA@mail.gmail.com>
 <169826846576.20306.981035382886610843@noble.neil.brown.name> <092891b2-b1cb-4b95-bb6b-65e538378d99@kadam.mountain>
In-Reply-To: <092891b2-b1cb-4b95-bb6b-65e538378d99@kadam.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Oct 2023 08:56:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmcCTr4zmDD2ttbgkjui=hC_PuHpy_mjUhAafKwKq5PA@mail.gmail.com>
Message-ID: <CAMuHMdUmcCTr4zmDD2ttbgkjui=hC_PuHpy_mjUhAafKwKq5PA@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, ksummit@lists.linux.dev, 
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 6:29=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
org> wrote:
> For a new driver, what I sometimes to is put a summary at the top.
> "Thanks.  The only real bug is some missing error codes in probe.  I had
> some other style nits as well.  See below for all the details."  I
> normally write the email first and then chop out the "no comment"
> functions at the end.  (Sometimes I chop out the no comment functions
> at the begining and then I have to start over when I change my mind).

Sounds very familiar (also the (...) part ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

