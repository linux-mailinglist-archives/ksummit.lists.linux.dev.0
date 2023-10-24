Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A877D5649
	for <lists@lfdr.de>; Tue, 24 Oct 2023 17:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B8A1C20C6E
	for <lists@lfdr.de>; Tue, 24 Oct 2023 15:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCD737162;
	Tue, 24 Oct 2023 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxCyJJJR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0920C3714C;
	Tue, 24 Oct 2023 15:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEECC433CB;
	Tue, 24 Oct 2023 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698161282;
	bh=rTvxCljC76kJYEmKBkHM2IhWXaKCGdgKaZZd3Qxzv/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxCyJJJRdFKvutQg+IEL4YCvyqBl/9MXeFPo7zj2SAzKp4h2lDb7e74GxFXKnnL2j
	 TeIUHLy+wSX27i1UFhsnvYPuNBZtWajCm3uaKsSJYgAPiqHT4j5p1QsUmvZ2qtlLLj
	 atBwH0aEjiMN7X7ipQVR+d/zKFo8q1U1aYf+V+61mrRrQtoiCKkSz6tma8AvBiFfPm
	 Zxnb5svpKo2Md97A4aHHZ6FynfM4jUf+OmOPSlv2iIBtuN2DxF2w7UsjbfmeY223bA
	 TK3F07EtA9WiOv92sV78LvHbFI6SOPj76VaRq2OQ6g2JF4mfdwV48TKv8Oq4qa2RZ8
	 WWFSW/DM5Pfkw==
Date: Tue, 24 Oct 2023 11:28:01 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev, outreachy@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024-notorious-elegant-crayfish-a45d63@meerkat>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com>
 <20231023-righteous-peridot-parakeet-1bbda0@meerkat>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023-righteous-peridot-parakeet-1bbda0@meerkat>

On Mon, Oct 23, 2023 at 03:41:48PM -0400, Konstantin Ryabitsev wrote:
> If it helps, I can add a mailing list etiquette page on subspace.kernel.org,
> so it's easier to find.

FWIW, such page now exists:
https://subspace.kernel.org/etiquette.html

-K

