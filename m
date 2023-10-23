Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA207D3FBF
	for <lists@lfdr.de>; Mon, 23 Oct 2023 21:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E220CB20DC2
	for <lists@lfdr.de>; Mon, 23 Oct 2023 19:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0ADE21A01;
	Mon, 23 Oct 2023 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD39219EE;
	Mon, 23 Oct 2023 19:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ce2988d62eso2337744a34.1;
        Mon, 23 Oct 2023 12:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698087649; x=1698692449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geG59CJUnKNbArhBFfxHpBXxgZZOqM365JF9tbFB7q4=;
        b=XagN2x3+BeFtWxmgjhTMgsC6Cx5hfvBUBwrY0dldZOLeO/NMk9ytk1Wts07i8MS4zI
         kw3FLmnWZObHJVGvDxIK9rcmA+d/b9+/MV6fYg2QydGPj9UwYaXrodvwtcWGlF6gQPOB
         kTotQIsB73sBTpDRnvlZ7MiywmpHlqrkBN/BGvKnRF55a7tOECZZhOHdv+XaiPSTrsEq
         XdxA+E2pVdxmVV9RMDecsu/vvbm7NeeH9QP0lqkkMcYScSMG/ufR6eQ6eNwLUV/T13Dd
         hTK/LXBNQy83+pmDgexyAlspvcONK2qMFPzwiQtIzaWHNoYJaYxMKGyvvIYELEZMBsuE
         GRcg==
X-Gm-Message-State: AOJu0Yy/Mk9Sap7NcoErf/vn5Rw/jDnGD/9CiHtz7Lz50R+zf1WvVTNY
	jszj+cs3NqINVc7up6nfbbRgptupRc0brw==
X-Google-Smtp-Source: AGHT+IEKckRGW5Iy7rY4l06w8YeFTYuSgr78+8BF6Yeg3uXdN0rQGsEtRbQmdI3Wmgaw3Gpz0gbAJQ==
X-Received: by 2002:a05:6830:61a:b0:6c4:7e5a:6db6 with SMTP id w26-20020a056830061a00b006c47e5a6db6mr10880400oti.17.1698087648654;
        Mon, 23 Oct 2023 12:00:48 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id v19-20020a9d7d13000000b006c7c1868b05sm1522921otn.50.2023.10.23.12.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 12:00:48 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6cf65093780so452596a34.0;
        Mon, 23 Oct 2023 12:00:47 -0700 (PDT)
X-Received: by 2002:a9d:6b1a:0:b0:6bc:8cd2:dd97 with SMTP id
 g26-20020a9d6b1a000000b006bc8cd2dd97mr10105569otp.29.1698087647687; Mon, 23
 Oct 2023 12:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org> <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Oct 2023 21:00:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgZjN7Z484NAO51DV0tSLbbiUJr2hhiUB80FBeyh2KKw@mail.gmail.com>
Message-ID: <CAMuHMdXgZjN7Z484NAO51DV0tSLbbiUJr2hhiUB80FBeyh2KKw@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Konstantin Ryabitsev <mricon@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev, 
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, Oct 23, 2023 at 8:56=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> w=
rote:
> > Well here's a task: write a bot which follows the mailing lists and
> > sends people nastygrams if one of their emails is more than 95%(?)
> > quoted text.
>
> I think that might be better off as a spam filter rule.
>
> Don't make it some after-the-fact "trawl the lists". Just make it a
> bounce with a "you quoted too much". Same as the html avoidance.
>
> Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
> kind of reply, but if it's more than 50 lines of quoting, trigger a
> "at least equal parts new message".

How to handle the (unfortunately fairly common) case of
reply-with-CC-of-forgotten-relevant-person_added?

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

