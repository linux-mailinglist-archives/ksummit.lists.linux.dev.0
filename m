Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E3B7D7432
	for <lists@lfdr.de>; Wed, 25 Oct 2023 21:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92521C20B2B
	for <lists@lfdr.de>; Wed, 25 Oct 2023 19:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C2831A6A;
	Wed, 25 Oct 2023 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B026E32;
	Wed, 25 Oct 2023 19:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE14DC433C8;
	Wed, 25 Oct 2023 19:27:52 +0000 (UTC)
Date: Wed, 25 Oct 2023 15:27:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, NeilBrown
 <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 ksummit@lists.linux.dev, outreachy@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231025152751.22639f2e@gandalf.local.home>
In-Reply-To: <e4aa47e3-4858-41ba-813f-c17aa5f5ba7d@p183>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	<20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
	<8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
	<169818295461.20306.14022136719064683486@noble.neil.brown.name>
	<53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
	<e4aa47e3-4858-41ba-813f-c17aa5f5ba7d@p183>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Oct 2023 21:55:16 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> It's MUAs failure. Microsoft "solved" this problem by forcing top
> posting onto everyone, but there is no reason Outlook couldn't scroll
> to the first reply in the middle of email. I use mutt, it doesn't
> scroll to the first reply either.

Outlook is the worse. There may be no reason it can't scroll to the first
reply, but in many cases it just hides it! When I worked at VMware, I would
always inline my replies (and I was forced to use outlook). If I didn't
remove the:

  On Wed, 25 Oct 2023 21:55:16 +0300
  Jane Doe <jane.doe@vmware.com> wrote:

Line at the top, it would show a blank message. I had to manually start
removing that when I received several responses telling me "You sent me a
blank email"!

-- Steve

