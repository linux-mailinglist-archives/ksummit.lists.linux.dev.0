Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2457D3F9B
	for <lists@lfdr.de>; Mon, 23 Oct 2023 20:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0213B20D5B
	for <lists@lfdr.de>; Mon, 23 Oct 2023 18:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C9D219EE;
	Mon, 23 Oct 2023 18:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BvHG9wo7"
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796A014AA9
	for <ksummit@lists.linux.dev>; Mon, 23 Oct 2023 18:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-53d8320f0easo5619817a12.3
        for <ksummit@lists.linux.dev>; Mon, 23 Oct 2023 11:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698087375; x=1698692175; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Iy/DV1+W1aTRYizOwSs6mzRycpuJfFfCR+p5jl4zqjA=;
        b=BvHG9wo7wlB93deGafAltI1sIiMeLYwfpxcatMc0yXK4QRVh9szmoAlWzDPdOzTaNE
         dcF3W5OO5xbbXUvEeFfR9Ak/bKaTx1b5v1qgicjtnfpYfOOWkPKPQOa/nRPmbzbXaZG6
         YaPTWtmi8FBHTZsviZgZ7d4vgVIDOGOzEcnKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698087375; x=1698692175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iy/DV1+W1aTRYizOwSs6mzRycpuJfFfCR+p5jl4zqjA=;
        b=L6b8MfqwhoUVF2+axK+x0eB19cgRnMkLkiE+W9MIsyg7J+gFKJhjJ7Tzxicv0tiSVp
         1Xfa9Qh+r8fsFwQXrenh2vN36Le0RvXVSmD1SEaKtMsJsoOO6Y1grSR36HhZyBPwFTza
         Ru7JwcwNMJYcWCb7K4dCAZCJdYQkzwod9mWzkh23Ioun2aZMubKp3XgAvMHvhad0zQgJ
         e0XW3qFoNAdbh6K5kaivhm7pJpiDxoseQrSZx91pAJJE+LkIp/TCeBQdsumRJPRhTPMz
         ROUOE4KvANHMilQzqdHAbtAFbe/JocCJGXQ8YBuE04JBz3VUy5KoiFzi+eLzJNq3YLik
         P7mA==
X-Gm-Message-State: AOJu0YxzntfYNRJTNi6+bZB4y6K7lZzIvhfk3a7r1HHjyxIgjXTi1XJx
	fhH9DBHlI9/zQ0CatbU1wNQ8TbtqAC9EoUIhn1snyQ==
X-Google-Smtp-Source: AGHT+IENQdK21cHAfijI6iXn4yLcQHYBBHnmfi88OM9rFKS5gAZ/dVviHgqE5lvzAYrex806eHyrww==
X-Received: by 2002:a50:9e69:0:b0:526:9cfb:c12 with SMTP id z96-20020a509e69000000b005269cfb0c12mr7693659ede.38.1698087375486;
        Mon, 23 Oct 2023 11:56:15 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id x7-20020aa7d6c7000000b0053ebafe7a60sm6799870edr.59.2023.10.23.11.56.14
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 11:56:15 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so5641790a12.0
        for <ksummit@lists.linux.dev>; Mon, 23 Oct 2023 11:56:14 -0700 (PDT)
X-Received: by 2002:a50:c35c:0:b0:53d:b6ac:5f64 with SMTP id
 q28-20020a50c35c000000b0053db6ac5f64mr7256172edb.18.1698087374654; Mon, 23
 Oct 2023 11:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain> <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
In-Reply-To: <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Oct 2023 08:55:56 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
Message-ID: <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: Andrew Morton <akpm@linux-foundation.org>, Konstantin Ryabitsev <mricon@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev, 
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Oct 2023 at 08:49, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> Well here's a task: write a bot which follows the mailing lists and
> sends people nastygrams if one of their emails is more than 95%(?)
> quoted text.

I think that might be better off as a spam filter rule.

Don't make it some after-the-fact "trawl the lists". Just make it a
bounce with a "you quoted too much". Same as the html avoidance.

Make it ok to quote 15 lines of commit message for a "Reviewed-by:"
kind of reply, but if it's more than 50 lines of quoting, trigger a
"at least equal parts new message".

I'm sure Konstantin has nothing better to do...

                Linus

