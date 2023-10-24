Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 044077D5DE7
	for <lists@lfdr.de>; Wed, 25 Oct 2023 00:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C879B21057
	for <lists@lfdr.de>; Tue, 24 Oct 2023 22:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D672D62D;
	Tue, 24 Oct 2023 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CFA2D61C;
	Tue, 24 Oct 2023 22:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79CFC433C7;
	Tue, 24 Oct 2023 22:05:18 +0000 (UTC)
Date: Tue, 24 Oct 2023 18:05:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "NeilBrown" <neilb@suse.de>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Dan Carpenter" <dan.carpenter@linaro.org>,
 ksummit@lists.linux.dev, outreachy@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231024180517.421618c0@gandalf.local.home>
In-Reply-To: <169818295461.20306.14022136719064683486@noble.neil.brown.name>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	<20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
	<8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
	<169818295461.20306.14022136719064683486@noble.neil.brown.name>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Oct 2023 08:29:14 +1100
"NeilBrown" <neilb@suse.de> wrote:

> Here we all are, brilliantly talented computer programmers who spend
> our days making amazing fast digital devices do amazingly clever and
> subtle things, inventing time-saving tools and processing vast amounts
> of data without blinking, but for some reason we think the task of
> skipping over a few thousand lines that all start with '> " is too hard
> for us and that we should, in stead, complain to some other human to
> convince them to make our life easier for us.
> 
> Does anyone else see the irony?

Did you also know that real-time developers are the most unpredictable?

-- Steve

