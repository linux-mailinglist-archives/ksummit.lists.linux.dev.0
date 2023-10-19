Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4027D00D9
	for <lists@lfdr.de>; Thu, 19 Oct 2023 19:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3D28B21413
	for <lists@lfdr.de>; Thu, 19 Oct 2023 17:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FC335517;
	Thu, 19 Oct 2023 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o09epg6r"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3532C7E;
	Thu, 19 Oct 2023 17:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6FAC433C7;
	Thu, 19 Oct 2023 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697737662;
	bh=VKaGxEAxlfSQwaqUlB/6PVF77fnIGJA9T2faQyqHGQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o09epg6r1yGFyJLZ4A0fI3LYCXOUQYKnj2vJOwoT7bTqHRcSC6cCyo/zvXUlWv0eq
	 hJki/tgVTFYLY8tem7/ocOwTlhkksWHdctxgtdOf+dHV4Lry42pvhf+UVJMY6jiUYM
	 WX+LZtnNdlSxuNbGJPREAcDxdtno3eXhjm/KQmXo=
Date: Thu, 19 Oct 2023 13:47:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: ksummit@lists.linux.dev, outreachy@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <20231019-guru-unpaired-1dd4bd@meerkat>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>

On Thu, Oct 19, 2023 at 07:11:36AM +0300, Dan Carpenter wrote:
> KTODO: add check for failure in function_something()
> 
> Then people can look on lore or use lei to find small tasks to work on
> or they could use lei.

We can also have bugbot turn these into bugzilla bugs, if there's consensus
that it would be helpful.

-K

