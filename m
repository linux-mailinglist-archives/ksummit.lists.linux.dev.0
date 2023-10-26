Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0A57D8B01
	for <lists@lfdr.de>; Thu, 26 Oct 2023 23:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1453C282183
	for <lists@lfdr.de>; Thu, 26 Oct 2023 21:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2613E473;
	Thu, 26 Oct 2023 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VidmOXVF"
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924643D3A5;
	Thu, 26 Oct 2023 21:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so1299252276.0;
        Thu, 26 Oct 2023 14:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698357533; x=1698962333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvwMcqSWwKO0wXJv0H7UCPPqsu6sxGdcOrGctTr5qgQ=;
        b=VidmOXVF4sTWZIOuXE/p8iOcIXoYTB0pU0pT5pLg4Bd11fukFLo1DCAUqMIeXclhge
         jhm4XZ9nc3b5lbOTzEs5BAAcilSPQ8nmoGzAOu0Mh3yN86ZqXoA0G1+kxwRmTKo2sgK+
         LPve7TYmGs/gEcNzfV/d+CHf6/kdS3AEfHgy5x+eiilqIYsfhQ9amDZLV+lcmRnLgqXP
         VEmYG+mKpRL0OH94MYK0NWuTmBeWYcVfJJEJ/u5tpKw34mI1ANAmfnnmDbfjB/9OmpCK
         BllMSWwNtvAydKAmad48DuGUWQRIbOn3/5GlEYjekqx1S7Rp8pMPjtCLdDMYXbdZ0FgN
         wP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698357533; x=1698962333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvwMcqSWwKO0wXJv0H7UCPPqsu6sxGdcOrGctTr5qgQ=;
        b=NJsK2sKmlj7jJ00IrrhzqQt/cAbcHoO4JgmBwDqmcFvtJqdlCI4Bl41vGZ5O5JabVf
         zKAcjNGBKGEgMoZ92C8p9ELazfOxUDp/rbjWVD5SQPvCLTJbjC4yRUWy40pzmW6+9XP5
         Qfiq6bmcSyHNctpGtqmtPY9Ryf1mVCFCAqx585o8TyBJSy1/WtWdBKKNzzI03cpiJ2IP
         ttS/jTWzE0Suf6hlTjcKNWA9VL5jhvIqnTgeEyKIloIRSb4GZng5HVp/LVkSdMnVFhuY
         L5YkZ6vFY5nTRBoCqv31OJUl7LAdoFLWhuTcQ7RAkCWE6001BRZRV1aQvYm1xLGpqR/J
         +vkA==
X-Gm-Message-State: AOJu0Ywt4sdfTvDILr6/GA45dvaszT4aQ15xmW9rvvzYs+CUy0s7ntB3
	7TugD1U981rTjIeIKO9F3MvkWNNhgN5ZtbBvZY0=
X-Google-Smtp-Source: AGHT+IGx/ZHQdoq72DxRa+WbDxL2QzPV1zMjFCJVUT76NH83eBA1Fk7QbBfs4Yj0Olum11qg0SZMgiYJ097GUhy6e1Q=
X-Received: by 2002:a25:4041:0:b0:da0:8283:416e with SMTP id
 n62-20020a254041000000b00da08283416emr6952142yba.27.1698357532913; Thu, 26
 Oct 2023 14:58:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
 <20231023-righteous-peridot-parakeet-1bbda0@meerkat> <20231024-notorious-elegant-crayfish-a45d63@meerkat>
In-Reply-To: <20231024-notorious-elegant-crayfish-a45d63@meerkat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Oct 2023 23:58:41 +0200
Message-ID: <CANiq72nndjv301OE9oZpO5Uqwf1-hMyGn5FVVWqyrCEY0_ZG2A@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	ksummit@lists.linux.dev, outreachy@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 5:28=E2=80=AFPM Konstantin Ryabitsev <mricon@kernel=
org> wrote:
>
> FWIW, such page now exists:
> https://subspace.kernel.org/etiquette.html

Thanks Konstantin -- I have added a link to it in the Rust for Linux webpag=
e.

I would suggest linking it at
https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interle=
aved-replies-in-email-discussions
too.

Cheers,
Miguel

